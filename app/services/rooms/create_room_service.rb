module Rooms
  class CreateRoomService
    attr_accessor :room, :name, :number, :user, :display_name

    def initialize(display_name:, name: "", user: nil)
      @name = name
      @display_name = display_name
      @user = user
      @room = Room.new
    end

    def call
      create_room
      add_host_to_room

      room
    end

    private

    def create_room
      @room.user = set_room_user
      @room.name = set_room_name
      @room.number = set_room_number
      @room.save!
    end

    def set_room_user
      return user unless user.nil?

      create_and_return_guest_user
    end

    def create_and_return_guest_user
      unique_key = SecureRandom.alphanumeric(12)
      user = User.new(
        name: display_name, username: "guest-#{unique_key}",
        email: "guest-#{unique_key}@gameofscrum.com",
        password: SecureRandom.alphanumeric(24), guest: true
      )
      user.skip_confirmation!
      user.save!

      user
    end

    def set_room_name
      return name unless name.blank?

      generated_name = SecureRandom.alphanumeric(12)
      loop do
        generated_name = SecureRandom.alphanumeric(12)
        break generated_name unless Room.exists?(name: generated_name)
      end

      generated_name
    end

    def set_room_number
      generated_number = rand(100..999_999_999)
      loop do
        generated_number = rand(100..999_999_999)
        break unless Room.exists?(number: generated_number)
      end

      generated_number
    end

    def add_host_to_room
      @room.room_users.create(
        user: @room.user,
        room: @room,
        host: true,
        active: true
      )
    end
  end
end
