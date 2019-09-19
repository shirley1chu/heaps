class HeapNode
  attr_reader :key, :value

  def initialize(key, value)
    @key = key
    @value = value
  end
end

class MinHeap
  def initialize
    @store = []
  end

  # This method adds a HeapNode instance to the heap
  # Time Complexity: O(logn)
  # Space Complexity: O(1)
  def add(key, value = key)
    @store.push(HeapNode.new(key, value))
    new_node_index = @store.length - 1
    heap_up(new_node_index)
  end

  # This method removes and returns an element from the heap
  #   maintaining the heap structure
  # Time Complexity: O(logn)
  # Space Complexity: O(1)
  def remove()
    return if @store.length == 0
    swap(0, @store.length - 1)
    removed_element = @store.pop
    heap_down(0)
    return removed_element.value
  end

  # Used for Testing
  def to_s
    return "[]" if @store.empty?

    output = "["
    (@store.length - 1).times do |index|
      output += @store[index].value + ", "
    end

    output += @store.last.value + "]"

    return output
  end

  # This method returns true if the heap is empty
  # Time complexity: O(1)
  # Space complexity: O(1)
  def empty?
    return @store[0].nil?
  end

  private

  # This helper method takes an index and
  #  moves it up the heap, if it is less than it's parent node.
  #  It could be **very** helpful for the add method.
  # Time complexity: O(logn)
  # Space complexity: O(1)
  def heap_up(index)
    parent_index = (index - 1) / 2
    return if parent_index < 0
    parent = @store[parent_index]
    current = @store[index]

    while parent_index >= 0 && parent.key > current.key
      swap(index, parent_index)
      index = parent_index
      parent_index = (index - 1) / 2
      parent = @store[parent_index]
    end
  end

  # This helper method takes an index and
  #  moves it up the heap if it's smaller
  #  than it's parent node.
  def heap_down(index)
    while index < @store.length
      left_idx = index * 2 + 1
      right_idx = index * 2 + 2
      child_index = nil
      left = @store[left_idx]
      right = @store[right_idx]

      if left && right
        child_index = left.key < right.key ? left_idx : right_idx
        if @store[child_index].key < @store[index].key
          swap(index, child_index)
          index = child_index
        else
          return
        end
      elsif left && !right
        return unless left.key < @store[index].key
        child_index = left_idx
        swap(index, child_index)
        index = child_index
      else
        return
      end
    end
  end

  # If you want a swap method... you're welcome
  def swap(index_1, index_2)
    temp = @store[index_1]
    @store[index_1] = @store[index_2]
    @store[index_2] = temp
  end
end
