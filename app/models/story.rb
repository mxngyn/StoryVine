class Story < ActiveRecord::Base

  belongs_to :author, class_name: "User"
  belongs_to :parent, class_name: "Story"
  belongs_to :snippet

  has_many :story_tags
  has_many :tags, through: :story_tags
  has_many :votes

  def vote_count
    self.votes.where(liked: true).count
  end

  def self.most_popular
    Story.all.where(published: true).map { |story| {story => story.vote_count} }.take(10)
  end

  def self.most_recent
    Story.all.where(published: true).sort_by(&:created_at).reverse.take(10)
  end

end


