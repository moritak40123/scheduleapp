class CandidatesController < ApplicationController
  before_action :authenticate_user!
  before_action :find_room, only: [:new, :create, :edit, :update]
  before_action :set_candidate, only: [:edit, :update, :destroy, :confirm]

  def index
    @rooms = current_user.rooms.includes(:user)
    @candidate = Candidate.new
    @candidates = current_user.candidates.includes(:user, :room)
  end

  def new
    @candidate = Candidate.new
    @candidates = Candidate.all
  end

  def create
    @candidate = @room.candidates.new(candidate_params)
    if @candidate.save
      redirect_to root_path(@room)
    else
      @candidates = @room.candidates.includes(:user)
      render :new
    end
  end

  def edit
  end

  def update
    @candidate.update(candidate_params)
    if @candidate.save
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    @candidate.destroy
    redirect_to root_path
  end

  def confirm
    @schedule = Schedule.new(
      title: @candidate.title,
      body: @candidate.body,
      start_time: @candidate.start_time,
      end_time: @candidate.end_time,
      room_id: @candidate.room_id,
      user_id: @candidate.user_id
    )
    if @schedule.save
      @candidate.destroy
      redirect_to root_path, notice: '予定が確定されました。'
    end
  end

  private

  def candidate_params
    params.require(:candidate).permit(:title, :body, :start_time, :end_time).merge(user_id: current_user.id)
  end

  def find_room
    @room = Room.find(params[:room_id])
  end

  def set_candidate
    @candidate = Candidate.find(params[:id])
  end
end
