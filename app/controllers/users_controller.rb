class UsersController < ApplicationController

  def create
    @user = GithubAuthenticator.authenticate(env['omniauth.auth'])
    if @user.save
      session[:current_user_id] = @user.id
      flash[:notice] = t('.success')
      redirect_to root_path
    else
      flash[:error] = t('.failure')
      redirect_to root_path
    end
  end

  def user_log_out
    session.delete(:current_user_id)
    if session[:current_user_id] == nil
      flash[:notice] = "You have successfully logged out."
    else
      flash[:error] = "Error! You may not be signed out."
    end
    redirect_to root_path
  end
end
