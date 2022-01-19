class RoomsController < ApplicationController
    before_action :redirect_if_not_signed_in
    def new
        @room = Room.new
    end

    def create
        @room = Room.new(room_params)
        if @room.save
            @room.code = Room.getCode
            @room.save
            RoomUser.create(user_id: current_user.id, room_id: @room.id)
            redirect_to "/rooms/#{@room.id}"
        else
            render "new"
        end
    end

    def room_params
        params.require(:room).permit(:name, :password, :description)
    end


    def join
        @room=Room.new
    end

    def validate
        room = Room.find_by_code(params[:room][:code])
        if(room)
            if(room.password == params[:room][:password])
                e = RoomUser.find_by(user_id: current_user.id, room_id: room.id)
                if(!e)
                    e = RoomUser.create(user_id: current_user.id, room_id: room.id)
                end
                redirect_to "/rooms/#{room.id}"
                return
            else
                flash.now[:error] = "Bad Room Password"
            end
        else
            flash.now[:error] = "room not found"
        end
        render :join
    end

    def my_rooms
        #render 'sessions/index.html.erb'
        @myrooms = current_user.rooms
    end

    def show
        @user = current_user
        @room = Room.find_by_id(params[:id])
    end

end