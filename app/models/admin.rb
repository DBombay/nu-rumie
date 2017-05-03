class Admin < User
  belongs_to :rumie_group, optional: true

  validates :role, presence: true, default: "admin"
end
