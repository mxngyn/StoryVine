class Snippet < ActiveRecord::Base

  belongs_to :user

  has_many :stories

  def self.most_recent
    Snippet.all.sort_by(&:created_at).reverse.take(10)
  end

  def self.most_popular
    Snippet.all.sort_by(&:score).reverse.take(10)
  end


end
