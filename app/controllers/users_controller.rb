class UsersController < ApplicationController

  def create
    @user = User.find_or_create_by(user_params)
    if @user.save
      flash[:notice] = "Welcome to Pulsar."
      redirect_to root_path
    else
      flash[:error] = "Unable to authenticate."
      redirect_to root_path
    end
  end

  private

  def user_params
    params['user'] = {}
    params['user']['name'] = env['omniauth.auth']['info']['nickname']
    params['user']['display_name'] = env['omniauth.auth']['info']['nickname']
    params['user']['github_token'] = env['omniauth.auth']['credentials']['token']
    params['user']['github_uuid'] = env['omniauth.auth']['uid']
    params.require(:user).permit(:github_uuid, :name, :display_name, :github_token)
  end

end
