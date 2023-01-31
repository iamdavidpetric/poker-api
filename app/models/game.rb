# == Schema Information
#
# Table name: games
#
#  id              :bigint           not null, primary key
#  entry_fee       :integer
#  place           :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  first_place_id  :bigint
#  second_place_id :bigint
#
# Indexes
#
#  index_games_on_first_place_id   (first_place_id)
#  index_games_on_second_place_id  (second_place_id)
#
# Foreign Keys
#
#  fk_rails_...  (first_place_id => users.id)
#  fk_rails_...  (second_place_id => users.id)
#
class Game < ApplicationRecord
  has_many :players
  has_many :users, through: :players
end
