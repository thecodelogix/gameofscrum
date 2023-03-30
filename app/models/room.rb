class Room < ApplicationRecord
  belongs_to :user

  validates :name, presence: true
  validates :number, presence: true, uniqueness: true

  scope :default, -> { where(private: false) }
  scope :private_rooms, -> { where(private: true) }
end
