require_relative "min_heap"
require "pry"

# This method uses a heap to sort an array.
# Time Complexity:  O(nlogn)
# Space Complexity: O(n)
def heapsort(list)
  # add each element to heap
  # pop each element back out
  return [] if list == []
  heap = MinHeap.new
  # heap.store = list

  # list.each_with_index do |elem, i|
  #   # binding.pry
  #   elem = HeapNode.new(elem)

  # end

  # list.length.times do
  #   elem = list.pop
  #   heap.add(elem)
  # end

  # list.length.times do

  # binding.pry
  # list.length.times do
  #   value = heap.remove
  #   heap.add(value)
  # end

  list.each do |elem|
    heap.add(elem)
  end

  i = 0
  until heap.empty?
    elem = heap.remove
    list[i] = elem
    i += 1
  end

  return list
end
