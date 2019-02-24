class CreatePlayers < ActiveRecord::Migration[5.2]
  def change
    create_table :players do |t|
      t.string :item
      t.string :name
      t.string :country
      t.integer :pop

      t.timestamps
    end
  end
end
