class RumieGroup < ApplicationRecord
  validates :group_name, presence: true
  validates :city, presence: true
  validates :state, presence: true

  belongs_to :creator, foreign_key: :creator_id, class_name: 'User'
  has_many :users
end
