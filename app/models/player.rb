class Player < ApplicationRecord
  belongs_to :User
  belongs_to :Game
end
