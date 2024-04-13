class AddStartPointAndEndPointToNode < ActiveRecord::Migration[7.0]
  def change
    add_column :nodes, :start_point, :boolean, default: false
    add_column :nodes, :end_point, :boolean, default: false
  end
end
