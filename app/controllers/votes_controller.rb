class VotesController < ApplicationController

  def create
    @story = Story.find(id)
    @vote = Vote.new(story_id: @story.id, liked: params[:vote][:liked], user_id: current_user.id)
    if @vote.save
      redirect_to :back
    else
      redirect_to :back
    end
  end

  def show
  end

  private

  def count_votes(story_votes)
    votes = story_votes.map do |vote|
      vote.liked
    end
    true_count = votes.count(true)
    false_count = votes.count(false)
    true_count - false_count
  end

  def vote_params
    params.require(:vote).permit(:liked, :story_id, :user_id)
  end
end

