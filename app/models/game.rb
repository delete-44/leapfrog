class Game < ApplicationRecord
  has_many :nodes, dependent: :destroy
  belongs_to :starting_node, class_name: 'Node', optional: true

  def starting_node
    nodes.find_by(start_point: true)
  end
end
