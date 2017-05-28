class Node
  attr_accessor :data, :left, :right
  def initialize(data)
    @left = nil
    @right = nil 
    @data = data
  end

  def insert(data)
    if data <= @data #if the value to insert is lower than the data held by the current node
      @left.nil? ? @left = Node.new(data) : @left.insert(data) #insert it to the left of the node if it doesn't already have a left child
    elsif data > @data					       #otherwise make a recursive call to go down one level until you find the proper place
      @right.nil? ? @right = Node.new(data) : @right.insert(data)
    end
  end
end

class BinaryTree
  def initialize
    @root = nil
  end

  def insert(data)
    if @root.nil?
      @root = Node.new(data)
    else
      @root.insert(data)
    end
  end

  def traverse_inorder(current_node=@root)
    print("{")
    left_side = current_node.left and traverse_inorder(left_side)
    print current_node.data
    right_side = current_node.right and traverse_inorder(right_side)
    print("}")
  end

  def search(current_node=@root, data) #false if the element isn't found, else return true
    return false if current_node.nil?
    return true if current_node.data == data

    if current_node.data < data
      search(current_node.right, data)
    else
      search(current_node.left, data)
    end
  end

  #when we remove a node from the tree, we clobber it from the structure and raise the leftmost child to take the place
  #of the node that was removed and we connect the previous rightmost child so it's the leftmost child of the new node
  def remove(current_node=@root, parent_node=nil, data_to_remove)
    if current_node.data.nil?
      puts "Data not found"
      return false 
    end
    if current_node.data == data_to_remove #if the data is found
      if current_node.right.nil? && current_node.left.nil? #and there's no subtrees
	parent_node.left == current_node ? parent_node.left = nil : parent_node.right = nil #assign to nil so it's clobbered
      elsif current_node.right.nil? && current_node.left #and there's only the left subtree
	parent_node.left == current_node.left
      elsif current_node.left.nil? && current_node.right #and there's only the right subtree
	parent_node.right == current_node.right
      end
      current_node.data = nil
      puts "Removed node with data #{data_to_remove} successfully"
      return true
    elsif current_node.data < data_to_remove
      remove(current_node.right, current_node, data_to_remove)
    else
      remove(current_node.left, current_node, data_to_remove)
    end
  end
end

binary_tree = BinaryTree.new
#insertion
binary_tree.insert(10)
[5, 15, 2, 9, 12, 19].each { |x| binary_tree.insert(x) }
#traversal
puts binary_tree.traverse_inorder
#search
puts binary_tree.search(10), binary_tree.search(9), binary_tree.search(9999999) #should be true, true, false
#removal
binary_tree.remove(15) and puts binary_tree.traverse_inorder
binary_tree.remove(5) and puts binary_tree.traverse_inorder
binary_tree.remove(100000) and binary_tree.traverse_inorder

