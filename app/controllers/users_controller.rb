class UsersController < ApplicationController
    before_action :redirect_if_not_signed_in
  
    def menu
        @user = current_user
    end

    def profile

    end
    
  
    def show
      #byebug
  
      @user = current_user
    end
  
    def edit
      @user = current_user
    end
  
    def update
      @user = current_user
      if(@user.authenticate(params[:user][:old_password]))
        if @user.update(user_params)
          flash[:success] = "User was successfully updated"
          redirect_to profile_path
        else
          redirect_to edit_profile_path
        end
      else
        flash[:error]="Incorrect password."
        redirect_to edit_profile_path
      end
    end
    
    def add_concert
      @concert_user=ConcertUser.new(user: current_user, concert_id: params[:concert_id])
      if(@concert_user.save)
        flash[:success]="Concert successfully added!"
        redirect_to profile_path
      else
        
        flash[:error]="Concert is already added!"
        redirect_to profile_path
      end
  
    end
  
    def delete_concert
        @concert_user=ConcertUser.find_by(user:current_user, concert_id: params[:concert_id])
        @concert_user&.destroy
        flash[:success]="Concert removed from list."
        redirect_to profile_path
    end
  end
  