class Rumie < ApplicationRecord
  validates :group_name, presence: true

  has_many :users
end
