class VotesController < ApplicationController

  def upvote
    @story = Story.find(params[:id])
    @vote = Vote.where(user_id: current_user.id, story_id: @story.id)
    if @vote.count == 0
      @vote.create(user_id: current_user.id, story_id: @story.id, liked: true)
    elsif @vote.count == 1
      @vote.update(vote_params)
    else
      redirect_to :back
    end
  end

  def downvote
    @story = Story.find(params[:id])
    @vote = Vote.where(user_id: current_user.id, story_id: @story.id)
    if @vote.count == 0
      @vote.create(user_id: current_user.id, story_id: @story.id, liked: false)
    elsif @vote.count == 1
      @vote.update(vote_params)
    else
      redirect_to :back
    end
  end

  private

  def vote_params
    params.require(:vote).permit(:liked, :story_id, :user_id)
  end
end

