class SchedulesController < ApplicationController
  before_action :authenticate_user!
  before_action :find_room, only: [:new, :create, :edit, :update]
  before_action :set_schedule, only: [:edit, :update, :destroy]

  def index
    @rooms = current_user.rooms.includes(:user)
    @schedule = Schedule.new
    @schedules = current_user.schedules.includes(:user)
    @candidates = current_user.candidates.includes(:user)
  end

  def new
    @schedule = Schedule.new
    @schedules = Schedule.all
  end

  def create
    @schedule = @room.schedules.new(schedule_params)
    if @schedule.save
      redirect_to room_schedules_path(@room)
    else
      @schedules = @room.schedules.includes(:user)
      render :new
    end
  end

  def edit
  end

  def update
    @schedule.update(schedule_params)
    if @schedule.save
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    @schedule.destroy
    redirect_to root_path
  end

  private

  def schedule_params
    params.require(:schedule).permit(:title, :body, :start_time, :end_time).merge(user_id: current_user.id)
  end

  def find_room
    @room = Room.find(params[:room_id])
  end

  def set_schedule
    @schedule = Schedule.find(params[:id])
  end

end
