class Story < ActiveRecord::Base

  include Flagging

  belongs_to :author, class_name: "User"
  belongs_to :parent, class_name: "Story"
  belongs_to :snippet

  has_many :story_tags
  has_many :tags, through: :story_tags
  has_many :votes

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
    Story.all.where(published: true).map { |story| {story => story.vote_count} }.take(10)
  end

  def self.most_recent
    Story.all.where(published: true).sort_by(&:created_at).reverse.take(10)
  end


  def self.flagged
    Story.all.where(flagged: true)
  end

  def award_badge
    if self.author.stories.count == 1
      @badge = Badge.create(title: "First Story Written", story_id: self.id)
      return @badge.title
    end
  end

end


