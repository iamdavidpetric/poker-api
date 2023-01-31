class AddColomnsToGames < ActiveRecord::Migration[6.0]
  def change
    add_reference :games, :first_place, foreign_key: { to_table: :users }
    add_reference :games, :second_place, foreign_key: { to_table: :users }
  end
end
