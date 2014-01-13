class LearningsController < ApplicationController

  def create
    @learning = Learning.new(learning_params)
    @learning.user = current_user
    if @learning.save
      flash[:notice] = "Good job!"
      redirect_to learning_path(@learning)
    else
      flash[:error] = "Error! Haven't you learned anything?"
      render :new
    end
  end

  def new
    if current_user == nil
      raise ActionController::RoutingError.new('Not Found')
    else
      @learning = Learning.new
    end
  end

  def show
    @learning = Learning.find(params[:id])
    @comment = Comment.new
    @comments = @learning.comments
  end

  private

  def learning_params
    params.require(:learning).permit(:content, :url, :user_id)
  end

end
