require 'test/unit'
require 'stack'

class Test_Stack < Test::Unit::TestCase
    def setup
        @s = Stack.new
    end

    def test_isempty
        @s.push "hoge" 
        assert_equal(@s.isEmpty, false)
        @s.pop
        assert_equal(@s.isEmpty, true) 
    end

    def test_push
        @s.push "hoge"
        assert_equal(@s.size, 1)
    end

    def test_pop
        @s.push "hoge"
        @s.push "uge"
        @s.push "uhihi"
        @s.pop
        assert_equal(@s.size, 2)
        assert_equal(@s.top, "uge")
        assert_equal(@s.bottle, ["hoge", "uge"])
    end

    def test_top
        @s.push "hoge"
        @s.push "uge"
        assert_equal("uge", @s.top)
    end

    def test_maxsize
        @s.push "hoge"
        @s.push "moge"
        assert_equal(@s.maxSize, 2)
    end

    def test_pop_exception
        assert_raise(StackError) do
            @s.pop
        end
    end

    def test_top_exception
        assert_raise(StackError) do
            @s.top
        end
    end

    def test_stack_over_flow
        16.times do
            @s.push("ttttt")
        end

        assert_equal(@s.size, 16)
        assert_raise(StackError) do
            @s.push("last.")
        end
    end
end
