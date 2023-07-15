class RoomsController < ApplicationController

  def index
    @schedules = Schedule.all
  end
  
  def new
    @room = Room.new
  end

  def create
    @room = Room.new(room_params)
    if @room.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @room = Room.find(params[:id])
    @schedules = @room.schedules
  end

  private

  def room_params
    params.require(:room).permit(:room_name, :description, user_ids: [])
  end
end
