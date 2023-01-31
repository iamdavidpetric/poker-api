class CreateGames < ActiveRecord::Migration[6.0]
  def change
    create_table :games do |t|
      t.integer :entry_fee
      t.string :place

      t.timestamps
    end
  end
end
