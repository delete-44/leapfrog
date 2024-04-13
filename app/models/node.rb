class Node < ApplicationRecord
  belongs_to :game

  has_many :parent_connections, class_name: 'Connection', foreign_key: 'parent_node_id'
  has_many :child_connections, class_name: 'Connection', foreign_key: 'child_node_id'

  def connections
    Connection.where("parent_node_id = ? OR child_node_id = ?", self.id, self.id)
  end
end
