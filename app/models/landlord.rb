class Landlord < User
  validates :role, presence: true, default: "landlord"

  validates :company
end
