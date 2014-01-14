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
end
