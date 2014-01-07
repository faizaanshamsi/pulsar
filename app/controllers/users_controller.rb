class UsersController < ApplicationController

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "Welcome to Pulsar."
      redirect_to new_learning_path
    else
      flash[:error] = "Unable to authenticate."
      redirect_to new_learning_path
    end
  end

  private

  def user_params
    params['user'] = {}
    params['user']['name'] = env['omniauth.auth']['info']['nickname']
    params['user']['github_token'] = env['omniauth.auth']['credentials']['token']
    params['user']['github_uuid'] = env['omniauth.auth']['uid']
    params.require(:user).permit(:github_uuid, :name, :display_name, :github_token)
  end

end
