class IdentitiesController < ApplicationController

  def create
    if attempt.valid?
      if attempt.user.persisted?
        flash[:notice] = 'Hello!'
        redirect_to new_learning_path
      else
        flash[:notice] = 'Welcome! Add your first learning.'
        session[:auth_data] = attempt.session_hash
        redirect_to new_learning_path
      end
    else
      flash[:notice] = 'Sorry, we could not grant you access'
      redirect_to landing_page_path
    end
  end

  protected
  def user
    attempt.try(:user)
  end

  def attempt
    @attempt ||= Authentication::Attempt.new(auth_data, params[:user])
  end

  def auth_data
    env['omniauth.auth'] || session[:auth_data]
  end

  def require_auth_data!
    access_denied if auth_data.nil?
  end
end
