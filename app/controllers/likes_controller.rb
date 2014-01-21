class LikesController < ApplicationController
  before_filter :authenticate_user

  def create
    @like = Like.new(learning_id: params[:learning_id], user: current_user)

    respond_to do |format|
      if @like.save
        format.html { redirect_to learning_path(Learning.find(params[:learning_id])) }
        format.json { render json: @like }
      else
        format.html { redirect_to learning_path(Learning.find(params[:learning_id])),error: "Error! Like could not be saved for some reason. Try again or whatever."}
        format.json { render json: @like.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @like = Like.find(params[:id])
    @like.destroy
    redirect_to learning_path(Learning.find(params[:learning_id]))
  end

end
