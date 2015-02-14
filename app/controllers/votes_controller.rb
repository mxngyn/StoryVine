class VotesController < ApplicationController
  before_action :set_story, :set_vote

  def upvote
    set_vote_up(@story.id, current_user.id)
    redirect_to @story
  end


  private

  def set_vote
    @vote = Vote.find_by(user_id: current_user.id, story_id: @story.id)
  end

  def set_story
    @story = Story.find(params[:id])
  end

  def vote_params
    params.require(:vote).permit(:liked, :story_id, :user_id)
  end

  def set_vote_up(story_id, user)
    if @vote == nil
      Vote.create(user_id: user, story_id: story_id, liked: true)
    elsif @vote.user_id == user
      @vote.update(liked: true)
    else
      redirect_to @story
    end
  end
end

