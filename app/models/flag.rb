class Flag < ActiveRecord::Base

  belongs_to :flaggable, polymorphic: true
  belongs_to :user

  def self.stories
    story_ids = Flag.where(flaggable_type: "Story").map { |flagged_story| flagged_story.id }
    story_ids.map {|story_id| Story.find(story_id)}
  end

  def self.snippets
    snippet_ids = Flag.where(flaggable_type: "Snippet").map { |flagged_snippet| flagged_snippet.id }
    snippet_ids.map {|snippet_id| Snippet.find(snippet_id)}
  end

end
