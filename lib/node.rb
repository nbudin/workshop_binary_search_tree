class Node
  attr_accessor :parent, :left, :right, :value

  def initialize(value, parent = nil)
    @value = value
    @parent = parent
  end

  def insert(new_value)
    if new_value < value
      if left
        left.insert(new_value)
      else
        self.left = Node.new(new_value, self)
      end
    else
      if right
        right.insert(new_value)
      else
        self.right = Node.new(new_value, self)
      end
    end
  end

  def values
    values = []
    values += left.values if left
    values << value
    values += right.values if right
    values
  end

  def left_height
    return 0 unless left
    left.height
  end

  def right_height
    return 0 unless right
    right.height
  end

  def left_diameter
    return 0 unless left
    left.diameter
  end

  def right_diameter
    return 0 unless right
    right.diameter
  end

  def diameter
    [1, left_diameter, right_diameter, left_height + right_height + 1].max
  end

  def height
    [0, left_height, right_height].max + 1
  end

  def min
    return left.min if left
    value
  end

  def max
    return right.max if right
    value
  end

  def find(search_value)
    return self if value == search_value
    return left.find(search_value) if left && search_value < value
    return right.find(search_value) if right && search_value > value
  end

  def inspect
    "#<Node:#{value} left:#{left.inspect} right:#{right.inspect}>"
  end
end