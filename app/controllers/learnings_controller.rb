class LearningsController < ApplicationController


  def create
    @learning = Learning.new(learning_params)
    if @learning.save
      flash[:notice] = "Good job!"
      redirect_to learning_path(@learning)
    else
      flash[:error] = "Error! Haven't you learned anything?"
      render :new
    end
  end

  def new
    @learning = Learning.new
  end

  def show
    @learning = Learning.find(params[:id])
    @comment = Comment.new
    @comments = @learning.comments
  end

  private

  def learning_params
    params.require(:learning).permit(:content, :url)
  end

end
