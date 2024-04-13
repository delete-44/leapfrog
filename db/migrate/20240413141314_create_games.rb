class CreateGames < ActiveRecord::Migration[7.0]
  def change
    create_table :games do |t|
      t.references :starting_node, foreign_key: { to_table: :nodes }

      t.timestamps
    end
  end
end
