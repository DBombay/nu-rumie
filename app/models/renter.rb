class Renter < User
  belongs_to :rumie_group, optional: true

  validates :role, presence: true, default: "renter"
  validates :budget, default: 0
end
