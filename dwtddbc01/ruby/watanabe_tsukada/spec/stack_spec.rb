# -*- coding:UTF-8 -*-
require 'stack'

describe Stack do

  before do
    @s = Stack.new
  end

  context "#empty?" do

    it "空ならtrueを返すこと" do
      @s.empty?.should eql true
    end

    it "空でなければfalseを返すこと" do
      @s.push 2
      @s.empty?.should eql false
    end

  end

  context "#push" do

    describe "pushしたあと" do
      it "valueがnilでないこと" do
        @s.push 1
        @s.values.should_not == nil
      end

      it "sizeが0でないこと" do
        @s.push 1
        @s.size.should_not == 0
      end
    end


    it "max_size以上にpushした場合にRangeErrorが発生すること" do
      lambda {
        @s.max_size.times { |i| @s.push i }
      }.should_not raise_error RangeError

      lambda {
        @s.push 1
      }.should raise_error RangeError

    end

  end

  context "#size" do

    it "空なら0を返すこと" do
      @s.size.should == 0
    end

    it "空でなければsizeを返すこと" do
      @s.push 1
      @s.size.should == 1

      @s.push 2
      @s.push 3
      @s.push 4
      @s.size.should == 4
    end

  end

  context "#pop" do

    it "空ならRangeErrorを返すこと" do
      lambda{ @s.pop }.should raise_error RangeError
    end

    it "空でなければRangeErrorを返さないこと" do
      @s.push 1
      lambda{ @s.pop }.should_not raise_error RangeError
    end

    it "最後にpushした値を取り除くこと" do
      @s.push 1
      @s.push 2
      @s.pop
      @s.top.should == 1

      @s.push 3
      @s.top.should == 3
    end

  end

  context "#top" do

    it "空ならRangeErrorを返すこと" do
      lambda{ @s.top }.should raise_error RangeError
    end


    describe "空でなければ" do
      it "RangeErrorを返さないこと" do
        @s.push 1
        lambda{ @s.top }.should_not raise_error RangeError
      end

      it "最後にpushした値を返すこと" do

        @s.push 2
        @s.top.should == 2

        @s.push 3
        @s.push 4
        @s.top.should == 4

      end
    end
  end

  context "#max_size" do

    it "max_sizeが16を返すこと" do
      @s.max_size.should == 16
    end

  end

end
