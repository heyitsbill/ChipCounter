class SessionsController < ApplicationController

    def new
        render :new
    end

    def create
        @user=User.find_by_username(params[:user][:username])
        if(@user&.authenticate(params[:user][:password]))
            session[:user_id]=@user.id
            redirect_to '/menu'
        else
            flash[:error]="Incorrect username or password."
            redirect_to login_path
        end        
    end

    def destroy
        #byebug
        session.delete(:user_id)
        flash[:success]="Account successfully logged out."
        redirect_to "/login"
    end
    
end
