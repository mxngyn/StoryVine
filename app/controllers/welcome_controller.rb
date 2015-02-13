class WelcomeController < ApplicationController
  def index
    @recent_snippets = Snippet.most_recent
    @popular_snippets = Snippet.most_popular
  end
end
