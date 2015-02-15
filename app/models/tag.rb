class Tag < ActiveRecord::Base

  has_many :story_tags
  has_many :stories, through: :story_tags

  def self.all_tags
    self.all.map {|t| t.name}
  end

  def self.tags_for_select
    self.all_tags.map {|a| [a,a]}
  end

end
