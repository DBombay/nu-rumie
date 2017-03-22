if Rails.env.development? || Rails.env.production?
  User.destroy_all
  RumieGroup.destroy_all
  db = User.create!(
    first_name: 'Devin',
    last_name: 'Bombay',
    age: 29,
    gender: 'male',
    email: 'd.bombay@live.com',
    password: 'dbombay1',
    password_confirmation: 'dbombay1',
    admin: true
  )
  RumieGroup.create!(
    group_name: 'Wolf Pack of 1',
    description: "I need no rumies. For I am the wolfpack of 1.",
    creator_id: db.id
  )
end
