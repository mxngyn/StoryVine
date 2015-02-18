class Story < ActiveRecord::Base

  include Flagging

  belongs_to :author, class_name: "User"
  belongs_to :parent, class_name: "Story"
  belongs_to :snippet

  has_many :story_tags
  has_many :tags, through: :story_tags
  has_many :votes
  has_many :children, class_name: "Story", foreign_key: :parent_id

  has_many :flags, as: :flaggable

  has_many :badges


  validates_presence_of :title, :on => :update
  validates_presence_of :content, :on => :update

  searchable do
    text :title, :content
  end

  def vote_count
    self.votes.where(liked: true).count
  end

  def self.most_popular
    stories = Story.all.where(published: true).sort_by(&:vote_count).reverse.take(5)
    stories.map { |story| {story => story.vote_count} }
  end

  def self.most_recent
    Story.all.where(published: true).sort_by(&:created_at).reverse.take(5)
  end

  def award_badge
    has_a_first_story_badge = false
    self.badges.each do |badge|
      has_a_first_story_badge = true if badge.title = "First Story Written"
    end
    return "First Story Written" if has_a_first_story_badge
    if !has_a_first_story_badge
      badge = Badge.create(title: "First Story Written", story_id: self.id)
      self.badges << badge
      return badge.title
    end
  end

  def most_voted
    current_stories = Story.all.sort_by {|story| story.votes.count }
    if self.votes.count > current_stories.last.votes.count
      badge = Badge.create(title: "Most Voted", story_id: self.id)
      return badge.title
    end
  end

  def remove_dangerous_html_tags!
    Sanitize.fragment(self, Sanitize::Config::RESTRICTED)
  end

  def as_json(options={})
    { id: id,
      type: "stories",
      title: title,
      children: self.children }
  end


end


