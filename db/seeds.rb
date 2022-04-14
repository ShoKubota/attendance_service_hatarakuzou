admin_user = User.create!(
  name: '山田花子',
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

ids = [User.first.id, User.second.id, User.third.id, User.fourth.id]

ids.each do |id|
  user = User.find(id)
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