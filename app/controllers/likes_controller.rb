class LikesController < ApplicationController
  before_filter :authenticate_user

  def create
    @like = Like.new(learning_id: params[:learning_id], user_id: current_user.id)
    unless @like.save
      flash[:error] = "Error! Like could not be saved for some reason. Try again or whatever."
    end
    redirect_to learning_path(Learning.find(params[:learning_id]))
  end

  def destroy
    @like = Like.find(params[:id])
    @like.destroy
    redirect_to learning_path(Learning.find(params[:learning_id]))
  end

end
