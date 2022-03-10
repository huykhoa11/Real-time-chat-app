class MessagesController < ApplicationController
	before_action :authenticate_user!

  def index 
  end

  def create
  	#@messages = Message.all
  	@message = Message.new(message_params)
  	@message.user = current_user
  	#@message.save
    str = @message.user.email.split('@')
    if @message.save
      ActionCable.server.broadcast 'chat_channel',
                                    contentt: @message.body,
                                    namee: str[0],
                                    timee: @message.created_at.strftime("%I:%M %p")
    end

  end

  def destroy
      @message = Message.find(params[:id])
      @message.destroy
      redirect_to root_path
  end

  private
  def message_params
  	params.require(:message).permit(:body)
  end

end
