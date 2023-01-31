users = [{ id: 1, name: 'Stefan', nickname: 'Stefanut' },
         { id: 2, name: 'Dragos', nickname: 'Dragosut' },
         { id: 3, name: 'Alex', nickname: 'Alecs' }]

users.each do |seed_user|
  user = User.find_or_initialize_by(id: seed_user[:id])
  user.name = seed_user[:name]
  user.nickname = seed_user[:nickname]
  user.save if user.changed?
end

puts "Now you have #{User.count} users"

games = [{ id: 1, entry_fee: 50, place: 'Pascan', first_place_id: nil, second_place_id: nil },
         { id: 2, entry_fee: 60, place: 'Vlaicu', first_place_id: nil, second_place_id: nil }]

games.each do |seed_game|
  game = Game.find_or_initialize_by(id: seed_game[:id])
  game.entry_fee = seed_game[:entry_fee]
  game.place = seed_game[:place]
  game.first_place_id = seed_game[:first_place_id]
  game.second_place_id = seed_game[:second_place_id]
  User.all.each do |user|
    game.players.create(user_id: user.id, rebuy: 1)
    puts "#{user.name} sta amu la masa la #{game.place}"
  end
  game.save if game.changed?
end

puts "Now you have #{Game.count} games"
puts "Now you have #{Player.count} players"
