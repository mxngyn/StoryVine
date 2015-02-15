class BadgesController < ApplicationController
  def index
    @badges = Badge.all
  end

  def show
    @badge = Badge.find(params[:id])
  end

  def create
    # @user = current_user
    # if @user.stories.count == 1
    #   Badge.create(title: "First Story Written", story_id: @user.stories.first.id)
    # end
  end

  def destroy
  end
end
