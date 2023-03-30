class Room < ApplicationRecord
  belongs_to :user
  has_many :room_users, dependent: :destroy

  validates :name, presence: true
  validates :number, presence: true, uniqueness: true

  scope :default, -> { where(private: false) }
  scope :private_rooms, -> { where(private: true) }
end
