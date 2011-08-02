# -*- coding: utf-8 -*-
class Kvs
  def initialize
    @values = Hash.new
  end

  def put key, value
    @values.store key, value
  end

  def get key
    @values[key]
  end

  def dump
    ''
  end
end
