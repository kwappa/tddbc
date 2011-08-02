# -*- coding: utf-8 -*-
class Kvs
  def initialize
    @values = Hash.new
  end

  def put key, value
    raise KeyError if key.nil?
    @values.store key, value
  end

  def get key
    @values[key]
  end

  def dump
    dump_str = ''
    @values.each do |k, v|
      dump_str += "\n" unless dump_str.empty?
      dump_str += "#{k}:#{v}"
    end
    dump_str
  end

  def delete key
    raise KeyError if key.nil?
    @values.delete key
  end

  def merge values
    unless values.class == Hash
      if values.class == Array && values.count % 2 == 0
        values = Hash[*values]
      else
        raise ArgumentError
      end
    end
    values.each do |k, v|
      self.put k, v
    end
  end
end
