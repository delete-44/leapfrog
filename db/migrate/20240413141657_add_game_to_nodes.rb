class AddGameToNodes < ActiveRecord::Migration[7.0]
  def change
    add_reference :nodes, :game, null: false, foreign_key: true
  end
end
