class MessagesController < ApplicationController

  def index
    @messages = Message.order('id DESC')
  end

  def new
    @message = Message.new
  end

  def create
    Message.create(message_params)
    redirect_to :root
  end

  def destroy
    message = Message.find(params[:id])
    if message.user_id == current_user.id
      if message.comments.length > 0
        message.comments.each do |comment|
          comment.destroy
        end
      end
      message.destroy
    redirect_to :root
    end
  end

  def edit
    @message = Message.find(params[:id])
  end

  def update
    message = Message.find(params[:id])
    message.update(message_params)
    redirect_to :root
  end

  def show
    @message = Message.find(params[:id])
    @comments = @message.comments.includes(:user).order('id DESC')
    @comment = Comment.new
  end

  private
  def message_params
    # binding.pry
    params.require(:message).permit(:message).merge(user_id: current_user.id)
    # .merge(current_user.id)
  end

end
