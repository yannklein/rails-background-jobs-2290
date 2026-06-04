class MessagesController < ApplicationController

  def create
    @chat = current_user.chats.find(params[:chat_id])
    @challenge = @chat.challenge
    @message = Message.new(message_params)
    @message.chat = @chat
    @message.role = "user"

    if @message.save
      CreateChatAssistantMessageJob.perform_later(@message)

      respond_to do |format|
        format.turbo_stream # renders `app/views/messages/create.turbo_stream.erb`
        format.html { redirect_to chat_path(@chat) }
      end
    else
      respond_to do |format|
        format.turbo_stream { render turbo_stream: turbo_stream.update("new_message_container", partial: "messages/form", locals: { chat: @chat, message: @message }) }
        format.html { render "chats/show", status: :unprocessable_entity }
      end
    end
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end
end
