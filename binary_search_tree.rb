require 'byebug'

class BinarySearchTree
  def initialize(root_val = nil)
    @root = BSTNode.new(root_val)
  end

  attr_accessor :root

  def find(el, root = @root)
    return true if el == root.value

    if el <= root.value
      return false unless root.left_child
      find(el, root.left_child)
    elsif el > root.value
      return false unless root.right_child
      find(el, root.right_child)
    end
  end

  def insert(root = @root, el)
    new_node = BSTNode.new(el)

    unless root.value
      root.value = el
      return
    end

    if new_node.value <= root.value
      return insert(root.left_child, new_node.value) unless root.left_child.nil?
      new_node.parent = root
      return root.left_child = new_node
    elsif el > root.value
      return insert(root.right_child, new_node.value) if root.right_child
      new_node.parent = root
      return root.right_child = new_node
    end

    el
  end

  def delete(el, root = @root)
    if el == root.value
      if root.left_child == nil && root.right_child == nil
        if root.value > root.parent.value
          root.parent.right_child = nil
          el = nil
          return
        else
          root.parent.left_child = nil
          el = nil
          return
        end
      elsif root.left_child == nil || root.right_child == nil
        if root.value > root.parent.value
          root.parent.right_child = root.right_child unless root.right_child == nil
          root.parent.right_child = root.left_child unless root.left_child == nil
        else
          root.parent.left_child = root.right_child unless root.right_child == nil
          root.parent.left_child = root.left_child unless root.left_child == nil
        end
      else
        max_node = maximum(root)
        if root.value > root.parent.value
          root.parent.right_child = max_node
          max_node.left_child = root.left_child
        else
          root.parent.left_child = max_node
          max_node.left_child = root.left_child
        end
      end
    end

    if el <= root.value
      delete(el, root.left_child)
    elsif el > root.value
      delete(el, root.right_child)
    end
  end

  def is_balanced?
  end

  def in_order_traversal
  end

  def maximum(root)
    return root if root.right_child == nil
    maximum(root.right_child)
  end

  def depth
  end

  # def find_parent(node)
  #   return @root if @root.left == node || @root.right == node
  #   if @root.val > node.val
  #     left_tree = BinarySearchTree.new(@root.left)
  #     return left_tree.find_parent(node)
  #   else
  #     right_tree = BinarySearchTree.new(@root.right_value)
  #     return right_tree.find_parent(node)
  #   end
  # end
end
