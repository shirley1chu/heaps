require_relative "min_heap"

# This method uses a heap to sort an array.
# Time Complexity:  O(nlogn)
# Space Complexity: O(1)
def heapsort(list)
  return [] if list == []
  heap = MinHeap.new

  until list.empty?
    # O(1)
    elem = list.pop
    # O(nlogn)
    heap.add(elem)
  end

  until heap.empty?
    # O(nlogn)
    elem = heap.remove
    # O(1)
    list.push(elem)
  end

  return list
end
