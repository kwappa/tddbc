# encoding: utf-8
require 'rspec'
$: << './'
require 'stack.rb'

describe Stack do
  before do
    @stack = Stack.new
  end
  
  it "スタックが空" do
    @stack.empty?.should be_true
  end
  it "サイズが0" do
    @stack.size.should == 0
  end
  it "数字を積む" do
    @stack.push 1
    @stack.size.should == 1
  end
  it "popで取り除く" do
    @stack.push 1
    @stack.pop
    @stack.size.should == 0
  end
  it "stackの深さがいっぱいの状態でpush" do
    16.times.each do
      @stack.push 1
    end
    expect { @stack.push 1 }.to raise_error (RangeError)
  end
  it "トップの値を取得する" do
    @stack.push 1
    @stack.push 2
    @stack.top.should == 2
  end
  it "空の状態でトップをとろうとすると例外" do
    expect { @stack.top }.to raise_error (RangeError)
  end
  it "スタックの深さを取得する" do
    @stack.maxSize.should == 16
  end
  it "コンストラクタで深さを指定する" do
    stack = Stack.new(5)
    stack.maxSize.should == 5
  end 
  it "コンストラクタの引数分より多くpushをする" do
    stack = Stack.new(5)
    5.times.each do
      stack.push 1
    end
    expect { stack.push 1 }.to raise_error (RangeError)
  end
end

