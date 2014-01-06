class CommentsController < ApplicationController

  def create
    @learning = Learning.find(params[:learning_id])
    @comment = Comment.new(comment_params)
    @comment.learning = @learning
    if @comment.save
      flash[:notice] = "Good job!"
      redirect_to learning_path(@learning)
    else
      flash[:error] = "Error! Comment not saved.  "
      render :new
    end
  end

  def new
    @comment = Comment.new
  end

  def show
    @comment = Comment.find(params[:id])
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :learning_id)
  end

end
