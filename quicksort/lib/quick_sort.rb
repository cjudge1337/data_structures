class QuickSort
  # Quick sort has average case time complexity O(nlogn), but worst
  # case O(n**2).

  # Not in-place. Uses O(n) memory.
  def self.sort1(array)
    return array if array.length <= 1

    pivot = array[0]
    left = []
    right = []

    array[1..-1].each do |el|
      left << el if el <= pivot
      right << el if el > pivot
    end

    left = QuickSort.sort1(left)
    right = QuickSort.sort1(right)

    left + [pivot] + right
  end

  # In-place.
  def self.sort2!(array, start = 0, length = array.length, &prc)
  end

  def self.partition(array, start, length, &prc)
  end
end
