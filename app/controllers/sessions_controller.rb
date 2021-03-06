class SessionsController < ApplicationController
    
    before_action :require_guest, except: [:destroy]
    
    def new
    end
    
    def create 
        user = User.find_by(username: params[:session][:username])
        if user and user.authenticate(params[:session][:password])
            session[:user_id] = user.id
            flash[:notice] = "You have successfully logged in"
            redirect_to root_path
        else
            flash.now[:error] = "There was something wrong with your login details"
            render 'new'
        end
    end

    def destroy
        session[:user_id] = nil
        flash[:success] = "you have successfully logged out"
        redirect_to login_path
    end
end
