class LikesController < ApplicationController

  def create
    @like = Like.new(learning_id: params[:learning_id], user_id: current_user.id)
    @like.save
    redirect_to learning_path(Learning.find(params[:learning_id]))
  end
end
