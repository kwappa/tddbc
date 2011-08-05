#!/usr/bin/env ruby
# -*- coding:UTF-8 -*-

class Stack

  attr_reader :values, :size, :max_size

  def initialize
    @max_size = 16
    @size = 0
    @values = Array.new(@max_size)
  end

  def empty?
    @size == 0 ? true : false
  end

  def push v
    raise RangeError if size >= @max_size
    @values[@size] = v
    @size += 1
  end

  def pop
    raise RangeError if size == 0
    @size -= 1
  end

  def top
    raise RangeError if size == 0
    @values[@size - 1]
  end

end
