class BSTNode
  attr_accessor :left_child, :right_child, :parent
  attr_reader :value
  # attr_accessor :value, :left_child, :right_child, :parent

  def initialize(value = nil)
    @value = value
    @left_child = nil
    @right_child = nil
    @parent = parent
  end
end
