if Rails.env.development? || Rails.env.production?
  User.destroy_all
  User.create!(
    first_name: 'Devin',
    last_name: 'Bombay',
    age: 29,
    gender: 'male',
    email: 'd.bombay@live.com',
    password: 'dbombay1',
    password_confirmation: 'dbombay1',
    admin: true
  )
end
