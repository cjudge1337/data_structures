require_relative "static_array"
require 'byebug'

class DynamicArray
  attr_reader :length

  def initialize
    self.capacity = 8
    self.store = StaticArray.new(8)
    self.length = 0
  end

  # O(1)
  def [](index)
    check_index(index)
    return store[index]
  end

  # O(1)
  def []=(index, value)
    check_index(index)
    store[index] = value
  end

  # O(1)
  def pop
    raise "index out of bounds" if length == 0

    value = store[length - 1]
    store[length - 1] = nil
    self.length -= 1
    value
  end

  # O(1) ammortized; O(n) worst case. Variable because of the possible
  # resize.
  def push(val)
    resize! if length == capacity
    store[length] = val
    self.length += 1
    nil
  end

  # O(n): has to shift over all the elements.
  def shift
    raise "index out of bounds" if length == 0

    value = store[0]

    idx = 0
    while idx < length
      store[idx] = store[idx + 1]
      idx += 1
    end
    self.length -= 1
    value
  end

  # O(n): has to shift over all the elements.
  def unshift(val)
    resize! if length == capacity

    idx = length
    while idx > 0
      store[idx] = store[idx - 1]
      idx -= 1
    end
    self.length += 1
    store[0] = val
    nil
  end

  protected
  attr_accessor :capacity, :store
  attr_writer :length

  def check_index(index)
    unless (index >= 0) && (index < length)
      raise "index out of bounds"
    end
  end

  # O(n): has to copy over all the elements to the new store.
  def resize!
    new_store = StaticArray.new(capacity * 2)
    self.capacity *= 2

    idx = 0
    while idx < length
      new_store[idx] = store[idx]
      idx += 1
    end

    self.store = new_store
  end
end
