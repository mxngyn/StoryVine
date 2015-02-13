class VotesController < ApplicationController

  def create
    @vote = Vote.new(vote_params)
    @vote.user = current_user
    if @vote.save
      redirect_to :back
    end
  end

  def show
  end

  private

  def vote_params
    params.require(:vote).permit(:liked)
  end
end
