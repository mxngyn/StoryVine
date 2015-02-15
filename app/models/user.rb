class User < ActiveRecord::Base
  has_secure_password

  has_many :snippets
  has_many :stories, foreign_key: :author_id
  has_many :votes
  has_many :flags, as: :flaggable

  validates :username, presence: true
  # validates :password, presence: true

  def all_published
    self.stories.select do |story|
      story.published
    end
  end

  def all_unpublished
    self.stories.select do |story|
      story.published == false
    end
  end

end
