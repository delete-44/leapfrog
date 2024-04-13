class AddConnectionsTable < ActiveRecord::Migration[7.0]
  def change
    create_table :connections do |t|
      t.text :description
      t.references :parent_node, foreign_key: { to_table: :nodes }
      t.references :child_node, foreign_key: { to_table: :nodes }

      t.timestamps
    end
  end
end
