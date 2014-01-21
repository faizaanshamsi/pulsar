class UsersController < ApplicationController

  def create
    @user = GithubAuthenticator.authenticate(env['omniauth.auth'])
    if @user.save
      session[:img_url] = env['omniauth.auth']['info']['image'].split('?')[0] + '?s=200'
      session[:current_user_id] = @user.id
      flash[:notice] = t('.success')
      redirect_to root_path
    else
      flash[:error] = t('.failure')
      redirect_to root_path
    end
  end

  def log_out
    session.delete(:current_user_id)
    if session[:current_user_id] == nil
      flash[:notice] = "You have successfully logged out."
    else
      flash[:error] = "Error! You may not be signed out."
    end
    redirect_to root_path
  end

  def show
    @user = User.find(params[:id])
    @users_recent_learnings = @user.learnings.order(:created_at).limit(10)
    @img_url = session[:img_url]
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "Success! Your profile has been updated."
      redirect_to user_path(@user)
    else
      flash.now[:error] = "Unable to update profile. Please check input and retry."
      render 'show'
    end
  end

  protected

  def user_params
    params.require(:user).permit(:display_name)
  end

end
