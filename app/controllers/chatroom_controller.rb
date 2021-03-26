class ChatroomController < ApplicationController
    def home 
        @messages = Message.all
    end
end
