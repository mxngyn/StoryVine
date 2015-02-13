class VotesController < ApplicationController

  def upvote
    @story = Story.find(params[:id])
    @vote = Vote.new(user_id: 1, story_id: @story.id, liked: true)
    unless @vote.save
      db_vote = Vote.where(user_id: 1, votable_id: @story.id)[0]
      db_vote.update(liked: true)
    end
    redirect_to :back
  end

  def downvote
    @story = Story.find(params[:id])
    @vote = Vote.new(user_id: 1, story_id: @story.id, liked: false)
    unless @vote.save
      db_vote = Vote.where(user_id: current_user.id, votable_id: @story.id)[0]
      db_vote.update(liked: false)
    end
    redirect_to :back
  end

  private

  def vote_params
    params.require(:vote).permit(:liked, :story_id, :user_id)
  end
end

