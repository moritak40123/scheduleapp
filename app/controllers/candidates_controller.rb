class CandidatesController < ApplicationController
  before_action :authenticate_user!
  before_action :find_room, only: [:new, :create, :edit, :update]
  before_action :set_candidate, only: [:edit, :update, :destroy]

  def index
    @candidate = Candidate.new
    @candidates = current_user.candidates.includes(:user)
  end

  def new
    @candidate = Candidate.new
    @candidates = Candidate.all
  end

  def create
    @candidate = @room.candidates.new(candidate_params)
    if @candidate.save
      params[:candidates_attributes].each do |index, candidate_params|
        @candidate.candidates.create(candidate_params) if candidate_params[:start_time].present?
      end
      redirect_to room_candidates_path(@room)
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

  private

  def candidate_params
    params.require(:candidate).permit(:title, :body, candidates_attributes: [:start_time, :end_time]).merge(user_id: current_user.id)
  end

  def find_room
    @room = Room.find(params[:room_id])
  end

  def set_candidate
    @candidate = Candidate.find(params[:id])
  end
end
