class AddWikipediaToPlayers < ActiveRecord::Migration[5.2]
  def change
    add_column :players, :wikipedia, :string
  end
end
