# == Schema Information
#
# Table name: players
#
#  id         :bigint           not null, primary key
#  rebuy      :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  game_id    :bigint           not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_players_on_game_id  (game_id)
#  index_players_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (game_id => games.id)
#  fk_rails_...  (user_id => users.id)
#
class Player < ApplicationRecord
  belongs_to :user
  belongs_to :game

  def profit
    if game.first_place_id === id
      game.first_place_profit
    elsif game.second_place_id === id
      game.second_place_profit
    else
      game.entry_fee * rebuy
    end
  end
end
