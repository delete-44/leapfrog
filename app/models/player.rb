class Player < ApplicationRecord
  belongs_to :current_node, class_name: 'Node'
end
