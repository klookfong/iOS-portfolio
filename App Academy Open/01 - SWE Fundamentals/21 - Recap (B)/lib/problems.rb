# Write a method, least_common_multiple, that takes in two numbers and returns the smallest number that is a mutiple
# of both of the given numbers
def least_common_multiple(num_1, num_2)
    (1...num_1*num_2).each { |n| return n if n % num_1 == 0 && n % num_2 == 0 }
end


# Write a method, most_frequent_bigram, that takes in a string and returns the two adjacent letters that appear the
# most in the string.
def most_frequent_bigram(str)
    hash = Hash.new(0)
    str[0...-1].each_char.with_index { |char, i| hash[char + str[i+1]] += 1 } 
    hash.key(hash.values.max)
end


class Hash
    # Write a method, Hash#inverse, that returns a new hash where the key-value pairs are swapped
    def inverse
        hash = {}
        vals = self.values
        keys = self.keys
        vals.each_with_index do |v, i|
            hash[v] = keys[i]
            # self[k] = nil
        end
        hash
    end
end


class Array
    # Write a method, Array#pair_sum_count, that takes in a target number returns the number of pairs of elements that sum to the given target
    def pair_sum_count(num)
        hash = {}
        total=0
        self.each do |ele|
            diff = num-ele
            total += 1 if hash.has_key?(diff)
            hash[ele] = 1
        end
        total
    end

    # Write a method, Array#bubble_sort, that takes in an optional proc argument.
    # When given a proc, the method should sort the array according to the proc.
    # When no proc is given, the method should sort the array in increasing order.
    #
    # Sorting algorithms like bubble_sort, commonly accept a block. That block accepts
    # two parameters, which represents the two elements in the array being compared.
    # If the block returns 1, it means that the second element passed to the block
    # should go before the first (i.e. switch the elements). If the block returns -1,
    # it means the first element passed to the block should go before the second
    # (i.e. do not switch them). If the block returns 0 it implies that
    # it does not matter which element goes first (i.e. do nothing).
    #
    # This should remind you of the spaceship operator! Convenient :)
    def bubble_sort(&prc)
        prc ||= Proc.new { |a,b| a <=> b }
        pass = 0
        while pass <= self.length
            (0...self.length-1).each do |i|
                curr = self[i]
                nex = self[i+1]
                if prc.call(curr, nex) == 1
                    self[i], self[i+1] = nex, curr
                end
            end
            pass += 1
        end
        self
    end
end


