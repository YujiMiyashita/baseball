100.times do |user|
  user = User.create(
    user_name: Faker::Name.name,
    uid: 'hogehoge',
    email: Faker::Internet.email,
    password: 'hogehoge'
  )

  Profile.create(
    nick_name: Faker::Name.name,
    user_id: user.id,
    content: 'よろしくお願いいたします',
    team_id: 1,
    ballpark_id: 1
  )
end
