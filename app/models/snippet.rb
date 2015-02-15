class Snippet < ActiveRecord::Base

  belongs_to :user

  has_many :stories

  validates_presence_of :content, :on => :update

  def self.most_recent
    Snippet.all.sort_by(&:created_at).reverse.take(10)
  end

  def self.most_popular
    Snippet.all.map { |snippet| {snippet => snippet.stories.count} }.take(10)
  end

  def self.random
    Snippet.all.shuffle
  end


end
