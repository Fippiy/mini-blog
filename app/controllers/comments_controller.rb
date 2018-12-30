class CommentsController < ApplicationController
  def create
    @comment = Comment.create(comment_params)
    # @comment = Comment.create(comment: "comment", user_id: 1, message_id: 17)
    # redirect_to root_path
    redirect_to message_path(@comment.message_id)
  end

  def destroy
    comment = Comment.find(params[:id])
    comment.destroy if comment.user_id == current_user.id
    redirect_to message_path(comment.message_id)
  end

  private
  def comment_params
    params.require(:comment).permit(:comment).merge(message_id: params[:message_id],user_id: current_user.id)
  end
end
