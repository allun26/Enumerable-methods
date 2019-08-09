module Enumerable
    def my_each
        self.length.times {|i| yield(self[i])}
    end

    def my_each_with_index
        self.length.times {|i| yield(self[i], i)}
    end

    def my_select
        new_array = []
        self.my_each {|i| new_array << i if yield(i)}
        return new_array
    end

    def my_all?
        self.my_each {|i| return false if !yield(i)}
        return true
    end

    def my_any?
        self.my_each {|i| return true if yield(i)}
        return false
    end

    def my_none?
        self.my_each {|i| return false if yield(i)}
        return true
    end

    def my_count(item = nil)
        count = 0
        if item != nil
          self.my_each{ |i| count += 1 if i == item }
        elsif block_given?
          self.my_each{ |i| count += 1 if yield(i)}
        else
          count = self.length 
        end
        return count
    end

    def my_map
        new_array = []
        self.my_each {|i| new_array << yield(i)}
        return new_array
    end

    def my_inject
        result = 0
        self.my_each {|i|  result = yield(result, i)}
        return result  
    end
end







arr = [1,2,1,1]

l = arr.my_inject {|s,i| s + i}

print l