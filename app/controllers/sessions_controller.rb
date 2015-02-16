class SessionsController < ApplicationController

  def new

  end

  def create

    @user = User.find_by(email: session_params[:email])

    if @user && @user.authenticate(session_params[:password])
      session[:user_id] = @user.id
      # flash[:notice] = "Welcome back, #{@user.username}!"
      render :show
    else
      redirect_to :back
    end
  end

  def destroy
    session.clear
    reset_session
    flash[:notice] = "Come back,soon!"
    redirect_to root_path
  end

  private

  def session_params
    params.require(:session).permit(:email, :password)
  end


end
