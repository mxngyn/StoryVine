class VotesController < ApplicationController
  before_action :set_story, :set_vote, except: [:destroy]

  def upvote
    if request.xhr?
      set_vote_up(@story.id, session[:user_id])
      render plain: "Votes: #{@story.vote_count}"
    end
  end


  def destroy
    @vote = Vote.find(params[:id])
    @vote.destroy
    render plain: ""
  end

  private

  def set_vote
    @vote = Vote.find_by(user_id: session[:user_id], story_id: @story.id)
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

