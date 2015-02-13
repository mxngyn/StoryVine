class VotesController < ApplicationController
  before_action :set_story, :set_vote

  def upvote
    if @vote == nil
      Vote.create(user_id: current_user.id, story_id: @story.id, liked: true)
      redirect_to :back
    elsif @vote.user_id == current_user.id
      @vote.update(liked: true)
      redirect_to :back
    else
      redirect_to :back
    end
  end

  def downvote
    if @vote == nil
      Vote.create(user_id: current_user.id, story_id: @story.id, liked: false)
      redirect_to :back
    elsif @vote.user_id == current_user.id
      @vote.update(liked: false)
      redirect_to :back
    else
      redirect_to :back
    end
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
end

