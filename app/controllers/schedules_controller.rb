class SchedulesController < ApplicationController
  def index
    @schedule = Schedule.new
    @schedules = current_user.schedules.includes(:user)
  end

  def new
    @room = Room.find(params[:room_id])
    @schedule = Schedule.new
    @schedules = Schedule.all
  end

  def create
    @room = Room.find(params[:room_id])
    @schedule = @room.schedules.new(schedule_params)
    if @schedule.save
      redirect_to room_schedules_path(@room)
    else
      @schedules = @room.schedules.includes(:user)
      render :new
    end
  end

  def edit
    @room = Room.find(params[:room_id])
    @schedule = Schedule.find(params[:id])
  end

  def update
    @room = Room.find(params[:room_id])
    @schedule = Schedule.find(params[:id])
    @schedule.update(schedule_params)
    if @schedule.save
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    schedule = Schedule.find(params[:id])
    schedule.destroy
    redirect_to root_path
  end

  private

  def schedule_params
    params.require(:schedule).permit(:title, :body, :start_time, :end_time).merge(user_id: current_user.id)
  end

end
