class UsersController < ApplicationController

  def create
    @user = User.find_or_create_by(user_params)
    if @user.save
      flash[:notice] = t('.success')
      redirect_to root_path
    else
      flash[:error] = t('.failure')
      redirect_to root_path
    end
  end

  private

  def user_params
    params['user'] = {}
    params['user']['name'] = env['omniauth.auth']['info']['nickname']
    params['user']['display_name'] = env['omniauth.auth']['info']['nickname']
    params['user']['github_uid'] = env['omniauth.auth']['uid']
    params.require(:user).permit(:github_uid, :name, :display_name)
  end

end
