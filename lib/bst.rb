require_relative 'node'
require 'pry'

class BST
  attr_accessor :root

  def insert(value)
    if root
      self.root.insert(value)
    else
      self.root = Node.new(value)
    end
  end

  def values
    return [] unless root

    root.values
  end

  def height
    return 0 unless root
    root.height
  end

  def diameter
    return 0 unless root
    root.diameter
  end

  def min
    return nil unless root
    root.min
  end

  def max
    return nil unless root
    root.max
  end

  def delete(value)
    return unless root

    node = root.find(value)
    left_values = node.left ? node.left.values : []
    right_values = node.right ? node.right.values : []

    if node.parent
      parent_node = node.parent
      parent_node.left = nil if node == parent_node.left
      parent_node.right = nil if node == parent_node.right
    else
      self.root = nil
      parent_node = self
    end

    (left_values + right_values).each do |value|
      parent_node.insert(value)
    end
  end

  def rebalance
    new_bst = BST.new
    new_bst.insert_balanced(values)
    new_bst
  end

  private

  def insert_balanced(values)
    if values.size % 2 == 1
      insert(values[values.size / 2 + 1])
    end

    insert_balanced(values.slice(0, values.size / 2))
  end
end
