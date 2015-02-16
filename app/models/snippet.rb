class Snippet < ActiveRecord::Base

  include Flagging

  belongs_to :user

  has_many :stories
  has_many :flags, as: :flaggable

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

  def self.flagged
    Snippet.all.where(flagged: true)
  end

  def remove_dangerous_html_tags!
    Sanitize.fragment(self, Sanitize::Config::RESTRICTED)
  end

end
