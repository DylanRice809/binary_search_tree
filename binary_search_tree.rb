require_relative '../recursion_practice/merge_sort'

class Node
  def initialize (value, l_child, r_child)
    @value = value
    @l_child = l_child
    @r_child = r_child
  end
end

class Tree
  include MergeSort

  def initialize (array)
    @array = remove_duplicates(merge_sort(array))
    @root = build_tree(@array)
  end

  # removes duplicates from a sorted array
  def remove_duplicates (array)
    i = 0
    while i < array.length do
      val_1 = array[i]
      val_2 = array[i+1]
      if (val_1 == val_2)
        array.delete_at(i+1)
      else
        i += 1
      end
    end
    array
  end

  def midpoint (array)
    start = 0
    finish = array.length - 1
    midpoint = (start + finish)/2
  end

  def build_tree(array)
    index = midpoint(array) 
    puts "Index: #{index}"
    puts "Array: #{array}"
    if (array.length == 1)
      return
    end
    
    node = Node.new(array[index], build_tree(array[0..index]), build_tree(array[index+1..array.length]))
  end
end

tree = Tree.new([1,2,3,4,5,6,7,8,9])
#tree = Tree.new(Array.new(10) { rand(1...10) })
p tree