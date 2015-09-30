class CommentsController < ApplicationController
  def index
    @comments = Comment.all
  end

  def create
    @comment = Comment.create! comment_params
    render json: @comment
  end

  def destroy
    @comment = Comment.find params[:id]
    @comment.destroy
    head :no_content
  end

  private
  def comment_params
    params.require(:comment).permit :content
  end
end
