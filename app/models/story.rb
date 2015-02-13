class Story < ActiveRecord::Base

  belongs_to :author, class_name: "User"
  belongs_to :parent, class_name: "Story"
  belongs_to :snippet

  has_many :story_tags
  has_many :tags, through: :story_tags
  has_many :votes

  def vote_count
    self.votes.where(liked: true).count - votes.where(liked: false).count
  end

end
