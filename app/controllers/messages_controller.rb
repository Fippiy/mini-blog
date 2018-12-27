class MessagesController < ApplicationController
  def index
    @messages = Message.all.order('id DESC')
  end

  def new
    @message = Message.new
  end

  def create
    Message.create(message_params)
    redirect_to :root
  end

  private
  def message_params
    # binding.pry
    params.require(:message).permit(:message).merge(user_id: current_user.id)
    # .merge(current_user.id)
  end
end
