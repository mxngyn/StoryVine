class SessionsController < ApplicationController

  def new

  end

  def create

    @user = User.find_by(email: session_params[:email])

    if @user && @user.authenticate(session_params[:password])
      session[:user_id] = @user.id
      redirect_to :dashboard
      flash[:notice] = "Welcome back, #{@user.username}!"
    else
      redirect_to :back
      flash[:notice] = "There was an error with your login."
    end
  end

  def show
    @user = User.find(session[:user_id])
    @flagged_stories = Flag.stories
    @flagged_snippets = Flag.snippets
  end

  def destroy
    session.clear
    reset_session
    redirect_to root_path
  end

  private

  def session_params
    params.require(:session).permit(:email, :password)
  end


end
