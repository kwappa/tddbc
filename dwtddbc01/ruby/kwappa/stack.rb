# -*- coding: utf-8 -*-
class Stack
  MAX_STACK_SIZE = 16

  def initialize
    @heap = Array.new(MAX_STACK_SIZE)
    @counter = 0
  end

  def empty?
    @counter == 0
  end

  def push value
    raise RangeError if @counter >= MAX_STACK_SIZE
    @heap[@counter] = value
    @counter += 1
  end

  def top
    raise RangeError if @counter == 0
    @heap[@counter - 1]
  end

  def pop
    raise RangeError if @counter == 0
    @counter -= 1
  end

  def size
    @counter
  end

  def max_size
    MAX_STACK_SIZE
  end
end
