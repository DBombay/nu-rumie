if Rails.env.development? || Rails.env.production?
  User.destroy_all
  RumieGroup.destroy_all
  User.create!(
    first_name: 'Devin',
    last_name: 'Bombay',
    age: 29,
    gender: 'male',
    email: 'd.bombay@live.com',
    password: 'dbombay1',
    password_confirmation: 'dbombay1',
    role: "admin",
    city: 'Philadelphia',
    state: 'PA',
    rumie_group_id: 1
  )
  User.create!(
    first_name: 'Lex',
    last_name: 'Sachdev',
    age: 26,
    gender: 'female',
    email: 'alexis.sachdev@gmail.com',
    password: 'snuggle',
    password_confirmation: 'snuggle',
    role: "moderator",
    city: 'Philadelphia',
    state: 'PA'
  )
  zb = User.create!(
    first_name: 'Zeus',
    last_name: 'Bombay',
    age: 7,
    gender: 'male',
    email: 'whosagoodboi@zeus.com',
    password: 'cookie',
    password_confirmation: 'cookie',
    role: "renter",
    city: 'Philadelphia',
    state: 'PA'
  )
  RumieGroup.create!(
    group_name: 'Wolf Pack of 1',
    description: "I need no rumies. For I am the wolfpack of 1.",
    max_users: 2,
    creator_id: zb.id,
    city: 'Philadelphia',
    state: 'PA'
  )
end
