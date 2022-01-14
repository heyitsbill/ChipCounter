class SessionsController < ApplicationController

    def index
        if signed_in?
            redirect_to "/menu"
        end
    end

    def new_account
        @user = User.new
    end

    def create_account
        @user = User.new(user_params)
        if @user.save
            flash[:success] = "User successfully created"
            session[:user_id] = @user.id
            redirect_to "/menu"
        else
            render "new_account"
        end
    end
    def user_params
        params.require(:user).permit(:username, :display_name, :password, :password_confirmation)
    end

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
        redirect_to "/"
    end
    
end
