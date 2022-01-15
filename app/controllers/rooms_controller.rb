class RoomsController < ApplicationController
    def new
        @room = Room.new
    end

    def create
        @room = Room.new(room_params)
        if @room.save
            @room.code = Room.getCode
            @room.save
            redirect_to "/rooms/#{@room.id}"
        else
            render "new"
        end
    end

    def room_params
        params.require(:room).permit(:name, :password, :description)
    end


    def join

    end

    def my_rooms
        #render 'sessions/index.html.erb'
        
    end

    def show
        @user = current_user
        @room = Room.find_by_id(params[:id])
    end

end