require 'byebug'

class Link
  attr_accessor :key, :val, :next, :prev

  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end

  def to_s
    "#{@key}: #{@val}"
  end

  def remove
    # optional but useful, connects previous link to next link
    # and removes self from list.
  end
end

class LinkedList
  def initialize
    @head = Link.new
    @tail = Link.new
  end

  def [](i)
    each_with_index { |link, j| return link if i == j }
    nil
  end

  def first
    @head.next
  end

  def last
    @tail.prev
  end

  def empty?
    return true if @head.next.nil?
    false
  end

  def get(key)

  end

  def include?(key)

  end

  def append(key, val)
    new_link = Link.new(key, val)
    if @head.next.nil?
      new_link.next = @tail
      new_link.prev = @head

      @head.next = new_link
      @tail.prev = new_link
    else
      prev_link = @tail.prev

      new_link.prev = prev_link
      new_link.next = @tail

      prev_link.next = new_link

      @tail.prev = new_link
    end
  end

  def update(key, val)
    return nil if empty?

    current_node = @head.next
    until current_node == @tail
      if current_node.key == key
        current_node.val = val
        break
      else
        current_node = current_node.next
      end
    end
  end

  def remove(key)

  end

  def each
  end

  # uncomment when you have `each` working and `Enumerable` included
  # def to_s
  #   inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  # end
end
