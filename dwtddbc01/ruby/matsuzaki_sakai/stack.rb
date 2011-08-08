
class StackError < Exception
end

class Stack
    @@maxsize = 16
    def initialize
        @bottle = Array.new
        @idx = 0
    end
    def isEmpty
        @idx == 0
    end

    def size
        @idx
    end

    def push e 
        if @idx+1 > @@maxsize
            raise StackError 
        end
        @bottle[@idx] = e
        @idx += 1 
    end
  
    def pop
        if @idx != 0
            @bottle.delete_at @idx-1
            @idx -= 1
        else
            raise StackError
        end
    end

    def top
        result = @bottle[self.maxSize-1] 
        unless result.nil?
            return result
        end
        raise StackError
    end

    def maxSize
        @idx
    end  

    attr_accessor :bottle
end
