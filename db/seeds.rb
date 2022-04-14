# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
admin_user = User.create!(
  name: '鈴木一郎'
  email: 'example@example.com',
  password: 'password',
  password_confirmation: 'password',
  salary: 1200,
  role: :admin
)

3.times do
  general_user = User.create!(
    name: Faker::JapaneseMedia::StudioGhibli.character,
    email: Faker::Internet.email,
    password: 'password',
    password_confirmation: 'password',
    salary: 1200,
    role: :general
  )
end

1.upto(3) do |i|
  user = User.find(i)
  1.upto(10) do |i|
    approved_attendance = user.attendances.create!(
      start_time: "2022-04-#{i} 10:00:00",
      end_time: "2022-04-#{i} 19:00:00",
      status: :approved
    )
  end
  unapproved_attendance = user.attendances.create!(
    start_time: "2022-04-14 10:00:00",
    end_time: "2022-04-14 19:00:00",
    status: :unapproved
  )
end
