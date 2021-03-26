class ChatroomController < ApplicationController
    before_action :require_user 

    def home 
        @messages = Message.custom_display
        @message = Message.new
    end
end
