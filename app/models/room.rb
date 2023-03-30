class Room < ApplicationRecord
  belongs_to :user

  validates :name, presence: true
  validates :number, presence: true, uniqueness: true
end
