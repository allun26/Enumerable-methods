# frozen_string_literal: true

# Enumerable module
module Enumerable
  def my_each
    length.times { |i| yield(self[i]) }
  end

  def my_each_with_index
    length.times { |i| yield(self[i], i) }
  end

  def my_select
    new_array = []
    my_each { |i| new_array << i if yield(i) }
    new_array
  end

  def my_all?
    my_each { |i| return false unless yield(i) }
    true
  end

  def my_any?
    my_each { |i| return true if yield(i) }
    false
  end

  def my_none?
    my_each { |i| return false if yield(i) }
    true
  end

  def my_count(item = nil)
    count = 0
    if !item.nil?
      my_each { |i| count += 1 if i == item }
    elsif block_given?
      my_each { |i| count += 1 if yield(i) }
    else
      count = length
    end
    count
  end

  def my_map(proc = nil)
    new_array = []
    if proc.nil?
      my_each { |i| new_array << yield(i) }
    elsif !proc.nil? && block_given?
      my_each { |i| new_array << proc.call(i) }
    else
      my_each { |i| new_array << proc.call(i) }
    end
    new_array
  end

  def my_inject(result = 0)
    my_each { |i| result = yield(result, i) }
    result
  end
end

def multiply_els(array)
  array.my_inject(1) { |sum, i| sum * i }
end
