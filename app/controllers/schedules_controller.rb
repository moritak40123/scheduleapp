class SchedulesController < ApplicationController
  def index
    @schedule = Schedule.new
    if params[:room_id]
      @room = Room.find(params[:room_id])
      if @room
        @schedules = @room.schedules.includes(:user)
      else
        redirect_to rooms_path
      end
    else
      @schedules = Schedule.all
    end
  end

  def new
    @schedule = Schedule.new
  end

  def create
    @room = Room.find(params[:room_id])
    @schedule = @room.schedules.new(schedule_params)
    if @schedule.save
      redirect_to room_schedules_path(@room)
    else
      @schedules = @room.schedules.includes(:user)
      render :index
    end
  end

  private

  def schedule_parameter
    params.require(:schedule).permit(:title, :body, :start_time, :end_time).merge(user_id: current_user.id)
  end

end
