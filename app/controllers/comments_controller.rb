class CommentsController < ApplicationController
  before_filter :authenticate_user

  def create
    @learning = Learning.find(params[:learning_id])
    @comment = Comment.new(comment_params)
    @comment.learning = @learning
    @comment.user = current_user
    if @comment.save
      flash[:notice] = "Good job!"
    else
      flash[:error] = "Error! Comment not saved.  "
    end
    redirect_to learning_path(@learning)
  end

  def new
    @comment = Comment.new
  end

  def show
    @comment = Comment.find(params[:id])
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :learning_id, :user_id)
  end

end
