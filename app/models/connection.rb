class Connection < ApplicationRecord
  belongs_to :parent_node, class_name: 'Node'
  belongs_to :child_node, class_name: 'Node'
end
