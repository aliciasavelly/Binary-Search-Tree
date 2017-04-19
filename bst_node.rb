class BSTNode
  def initialize(value = nil, left_child = nil, right_child = nil, parent = nil)
    @value = value
    @left_child = left_child
    @right_child = right_child
    @parent = parent
  end

  attr_accessor :value, :left_child, :right_child, :parent
end
