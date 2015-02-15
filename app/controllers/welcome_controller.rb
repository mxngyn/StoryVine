class WelcomeController < ApplicationController
  def index
    @recent_snippets = Snippet.most_recent
    @popular_snippets = Snippet.most_popular
    @recent_stories = Story.most_recent
    @popular_stories = Story.most_popular
    @flagged_stories = Flag.stories
    @flagged_snippets = Flag.snippets
  end
end
