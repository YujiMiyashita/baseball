central_league = {'広島東洋カープ' => 'マツダスタジアム', '読売ジャイアンツ' => '東京ドーム', '横浜DeNAベイスターズ' => '横浜スタジアム',
                  '東京ヤクルトスワローズ' => '神宮球場', '阪神タイガース' => '甲子園球場', '中日ドラゴンズ' => 'ナゴヤドーム'}
pacific_leacue = {'北海道日本ハムファイターズ' => '札幌ドーム', '福岡ソフトバンクホークス' => 'ヤフオクドーム', '千葉ロッテマリーンズ' => 'ZOZOTOWNマリンフィールド',
                  '東北楽天ゴールデンイーグルス' => 'コボスタ宮城', '埼玉西武ライオンズ' => '西武プリンスドーム', 'オリックスバファローズ' => '京セラドーム大阪'}

central_league.each do |team, ballpark|
  team = Team.create(name: team, league: true)
  Ballpark.create(name: ballpark, team_id: team.id)
end

pacific_leacue.each do |team, ballpark|
  team = Team.create(name: team, league: false)
  Ballpark.create(name: ballpark, team_id: team.id)
end

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
