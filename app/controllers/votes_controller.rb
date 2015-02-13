class VotesController < ApplicationController

  def upvote
    @current_user = User.find(1) # for testing purposes - will delete this later
    @story = Story.find(params[:id])
    @vote = Vote.where(user_id: @current_user.id, story_id: @story.id)
    if @vote.count == 0
      @vote.create(user_id: @current_user.id, story_id: @story.id, liked:true)
    else
      redirect_to :back
    end
  end

  def downvote
    @current_user = User.find(1) # for testing purposes - will delete this later
    @story = Story.find(params[:id])
    @vote = Vote.where(user_id: @current_user.id, story_id: @story.id)
    if @vote.count == 0
      @vote.create(user_id: @current_user.id, story_id: @story.id, liked: false)
    else
      redirect_to :back
    end
  end

  private

  def vote_params
    params.require(:vote).permit(:liked, :story_id, :user_id)
  end
end

