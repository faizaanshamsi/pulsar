class LearningsController < ApplicationController
  before_filter :authenticate_user

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

  def index
    @recent_learnings = Learning.order(:created_at).reverse_order.limit(10)
  end

  def new
    @learning = Learning.new
  end

  def show
    @learning = Learning.find(params[:id])
    @comment = Comment.new
    @comments = @learning.comments
    @user = current_user
  end

  private

  def learning_params
    params.require(:learning).permit(:content, :url)
  end

end
