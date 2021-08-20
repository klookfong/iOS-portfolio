def two_sum?(arr, target_sum)
    hash = Hash.new(0)
    arr.each do |e|
        #needed value
        target = e - target_sum
        return true if hash[target] == 1
        hash[e] += 1
    end
    false
end

arr = [0, 1, 5, 7]
p two_sum?(arr, 6) # => should be true
p two_sum?(arr, 10) # => should be false
