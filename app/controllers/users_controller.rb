class UsersController < ApplicationController
    before_action :require_guest 

    def new
        @user = User.new
    end

    def create
        @user = User.create(user_params)

        if @user and @user.valid?
            flash[:success] = "You have signed up successfully, you can now login and use the messaging app."
            redirect_to login_path
        else
            flash.now[:error] = "There are some errors in your details."
            render 'new'
        end
    end

    private 

    def user_params
        params.require(:user).permit(:username, :password)
    end
end