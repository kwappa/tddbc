# -*- coding: utf-8 -*-
require 'rspec'
require './kvs'

describe Kvs do
  before :all do
    @kvs = Kvs.new
  end

  describe '#put' do
    context 'put a pair of key and value' do
      subject { @kvs.put 'key1', 'value1' }
      it { should == 'value1' }
    end
  end

  describe '#get' do
    context 'put a pair of key and value' do
      before do
        @kvs.put 'key1', 'value1'
      end
      subject { @kvs.get 'key1' }
      it { should == 'value1' }
    end
  end

  describe '#dump' do
    context 'when empty' do
      subject { @kvs.dump }
      it { should == '' }
    end

    context 'after put one pair' do
      before do
        pending
        @kvs.put 'key1', 'value'
      end
      subject { @kvs.dump }
      it { should == "key1:value1" }
    end
  end
end
