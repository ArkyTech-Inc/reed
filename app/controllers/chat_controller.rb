require_relative '../services/chatgpt_service'
class ChatController < ApplicationController
  skip_forgery_protection
  def create
      message = params[:message]
      chatgpt_service = ChatGPTService.new(Rails.application.config.api_key)
      @response = chatgpt_service.send_message(message)
      render json: { response: @response }
    end
  end
  