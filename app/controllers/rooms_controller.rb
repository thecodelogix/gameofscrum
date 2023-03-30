class RoomsController < ApplicationController
  def create
  end

  def show
  end

  def update
  end

  def destroy
  end

  private

  def room_params
    params.require(:room).permit(:display_name)
  end
end
