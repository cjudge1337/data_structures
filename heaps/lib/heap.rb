class BinaryMinHeap
  def initialize(&prc)
    @store = []
    @prc = prc
  end

  def count
  end

  def extract
  end

  def peek
    @store[0]
  end

  def push(val)
  end

  protected
  attr_accessor :prc, :store

  public
  def self.child_indices(len, parent_index)
    result = []
    result << (parent_index * 2) + 1 unless ((parent_index * 2) + 1) > len - 1
    result << (parent_index * 2) + 2 unless ((parent_index * 2) + 2) > len - 1
    result
  end

  def self.parent_index(child_index)
    raise('root has no parent') if child_index.zero?
    (child_index - 1) / 2
  end

  def self.heapify_down(array, parent_idx, len = array.length, &prc)
    prc ||= Proc.new { |el1, el2| el1 <=> el2 }

    l_child_idx, r_child_idx = child_indices(len, parent_idx)

    parent_val = array[parent_idx]

    children = []
    children << array[l_child_idx] if l_child_idx
    children << array[r_child_idx] if r_child_idx

    if children.all? { |child| prc.call(parent_val, child) <= 0 }
     return array
    end

    swap_idx = nil
    if children.length == 1
      swap_idx = l_child_idx
    else
      swap_idx =
        prc.call(children[0], children[1]) == -1 ? l_child_idx : r_child_idx
    end

    array[parent_idx], array[swap_idx] = array[swap_idx], parent_val
    heapify_down(array, swap_idx, len, &prc)
  end

  def self.heapify_up(array, child_idx, len = array.length, &prc)
    return array if child_idx.zero?

    prc ||= Proc.new { |el1, el2| el1 <=> el2 }

    child_val = array[child_idx]

    if prc.call(array[child_idx], array[parent_index(child_idx)]) >= 0
      return array
    else
      array[child_idx] = array[parent_index(child_idx)]
      array[parent_index(child_idx)] = child_val
      heapify_up(array, parent_index(child_idx), len, &prc)
    end
  end
end
