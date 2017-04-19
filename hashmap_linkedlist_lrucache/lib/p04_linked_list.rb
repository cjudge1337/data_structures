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
  include Enumerable

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
    return nil if empty?

    current_node = @head.next
    until current_node == @tail
      if current_node.key == key
        return current_node.val
      else
        current_node = current_node.next
      end
    end

    nil
  end

  def include?(key)
    return nil if empty?

    current_node = @head.next
    until current_node == @tail
      if current_node.key == key
        return true
      else
        current_node = current_node.next
      end
    end

    false
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
    return nil if empty?

    current_node = @head.next
    until current_node == @tail
      if current_node.key == key
        prev_node = current_node.prev
        next_node = current_node.next

        prev_node.next = next_node
        next_node.prev = prev_node
        current_node.prev = nil
        current_node.next = nil
        break
      else
        current_node = current_node.next
      end
    end

    nil
  end

  def each(&prc)
    return nil if empty?

    return nil if empty?

    current_node = @head.next
    until current_node == @tail
      yield current_node
      current_node = current_node.next
    end

    self
  end

  # uncomment when you have `each` working and `Enumerable` included
  def to_s
    inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  end
end
