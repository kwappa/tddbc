# -*- coding: utf-8 -*-
require 'rspec'

$: << File.join(File.dirname(File.expand_path(__FILE__)), '..')
require 'stack'

describe Stack do
  before do
    @stack = Stack.new
  end

  describe '#empty?' do
    context '生成直後に呼び出す' do
      subject { @stack.empty? }
      it { should be_true }
    end

    context '値をpushしてから呼び出す' do
      before do
        @stack.push 1
      end
      subject { @stack.empty? }
      it { should be_false }
    end
  end

  describe '#top' do
    context '生成直後に呼び出す' do
      specify do
        expect { @stack.top }.to raise_error RangeError
      end
    end

    context '値を1つpushしてから呼び出す' do
      before do
        @stack.push 1
      end
      subject { @stack.top }
      it { should == 1 }
    end

    context '値を2つpushしてから呼び出す' do
      before do
        @stack.push 1
        @stack.push 3
      end
      subject { @stack.top }
      it { should == 3 }
    end
  end

  describe '#size' do
    context '生成直後に呼び出す' do
      subject { @stack.size }
      it { should == 0 }
    end

    context '値を1つpushしてから呼び出す' do
      before do
        @stack.push 1
      end
      subject { @stack.size }
      it { should == 1 }
    end
  end

  describe '#pop' do
    context '生成直後に呼び出す' do
      specify do
        expect { @stack.pop }.to raise_error RangeError
      end
    end

    context '値を1つpushしてから呼び出す' do
      before do
        @stack.push 1
        @stack.pop
      end
      subject { @stack.size }
      it { should == 0 }
    end
  end

  describe '#push' do
    context 'スタックがいっぱいの状態で呼び出す' do
      before do
        @stack.max_size.times { |c| @stack.push c }
      end
      specify do
        expect { @stack.push 1 }.to raise_error RangeError
      end
    end
  end

  describe '#max_size' do
    subject { @stack.max_size }
    it { should == Stack.const_get(:MAX_STACK_SIZE) }
  end
end
