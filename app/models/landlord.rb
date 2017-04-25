class Landlord < User
  validates :role, presence: true, default: "landlord"
end
