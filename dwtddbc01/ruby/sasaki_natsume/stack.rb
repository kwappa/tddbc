class Stack
  def initialize(maxsize = 16)
    @size = 0
    @maxsize = maxsize
    @stack = Array.new(@maxsize)
  end
  def empty?
    if @size == 0
      true
    else
        false
    end
  end
  def size
    @size
  end
  def push(value)
    raise RangeError if @size >= @maxsize
    @stack[@size] = value
    @size += 1
  end
  def pop
    @stack[@size] = nil
    @size -= 1
  end
  def top
    raise RangeError if @size == 0
    @stack[@size - 1]
  end
  def maxSize
    @maxsize 
  end
end
