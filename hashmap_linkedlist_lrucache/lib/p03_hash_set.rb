require_relative 'p02_hashing'
require 'byebug'

class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    hash_num = key.hash
    return if include?(key)
    resize! if @count >= @store.length
    self[hash_num] << hash_num
    @count += 1
    hash_num
  end

  def include?(key)
    hash_num = key.hash
    return true if self[hash_num].include?(hash_num)
    false
  end

  def remove(key)
    hash_num = key.hash
    return if include?(key) == false
    self[hash_num].delete(hash_num)
    @count -= 1
    hash_num
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    @store[num % num_buckets]
  end

  def num_buckets
    @store.length
  end

  def resize!
    new_store = Array.new(num_buckets * 2) { Array.new }

    @store.each do |bucket|
      bucket.each do |int|
        new_store[int % (num_buckets * 2)] << int
      end
    end

    @store = new_store
  end
end
