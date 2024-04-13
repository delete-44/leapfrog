class CreatePlayers < ActiveRecord::Migration[7.0]
  def change
    create_table :players do |t|
      t.references :current_node, foreign_key: { to_table: :nodes }

      t.timestamps
    end
  end
end
