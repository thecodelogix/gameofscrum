class RoomsController < ApplicationController
  before_action :set_room, only: %i[show update destroy]

  def new
    @room = Room.new
  end

  def create
    @room = Rooms::CreateRoomService.new(
      display_name: room_params[:display_name],
      user: current_user
    ).call

    sign_in @room.user unless user_signed_in?

    redirect_to room_path(number: @room.number)
  rescue StandardError => e
    flash[:error] = e.message
    render :new
  end

  def show
  end

  def update
  end

  def destroy
  end

  private

  def room_params
    params.permit(:display_name)
  end

  def set_room
    @room = Room.find_by(number: params[:number])
  end
end
