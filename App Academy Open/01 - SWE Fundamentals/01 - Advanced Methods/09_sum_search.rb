def sum_search(arr, sum)
    hash = Hash.new(0)
    arr.each do |ele|
        diff = sum-ele
        return true if hash[diff] > 0
        hash[ele] += 1
    end
    false
end

arr = [2,4,6]

puts sum_search(arr, 10)
puts sum_search(arr, 20)