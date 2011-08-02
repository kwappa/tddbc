# -*- coding: utf-8 -*-
require 'rspec'
require './kvs'

describe '#put' do
  before do
    @kvs = Kvs.new
  end
  context 'return value when key and value were given' do
    subject { @kvs.put 'key1', 'value1' }
    it { should == 'value1' }
  end
end
