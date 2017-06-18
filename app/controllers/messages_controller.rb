require "uri"
require "net/http"
require "json"

class MessagesController < ApplicationController
  COOKIE_NAME = '_rdtestsite.cookie'
  URL = Rails.env.production? ? 'https://rdtestapplication.herokuapp.com/contacts/save-contact' : 'http://localhost:3000/contacts/save-contact'

  def create
  	@message = Message.new(message_params)

  	respond_to do |format|
  	  if @message.save

        if !cookies[COOKIE_NAME].nil?
          data_cookie = cookies[COOKIE_NAME]
          data_cookie = JSON.parse(data_cookie)
          params = {
            email: @message.email,
            key: data_cookie["key"]
          }
          Net::HTTP.post_form(URI.parse(URL), params)
        end

  	    format.html { redirect_to '/contact', notice: 'Message was successfully sent.' }
  	    format.json { render :show, status: :created, location: @message }
  	  else
  	    format.html { render 'pages/contact' }
  	    format.json { render json: @message.errors, status: :unprocessable_entity }
  	  end
  	end
  end

  private

    def message_params
      params.require(:message).permit(:name, :email, :message)
    end
end
