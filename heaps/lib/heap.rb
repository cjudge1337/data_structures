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
  end

  def self.heapify_up(array, child_idx, len = array.length, &prc)
  end
end
