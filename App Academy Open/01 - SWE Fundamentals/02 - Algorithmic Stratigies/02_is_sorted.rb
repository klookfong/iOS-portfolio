# Write a method, is_sorted(arr), that accepts an array of numbers as an arg.
# The method should return true if the elements are in increasing order, false otherwise.
# Do not use the built-in Array#sort in your solution :)

def is_sorted(arr)
    #bubble sort
    pass = 0
    comp = arr.clone
    while pass <= comp.length
        (0...comp.length-1).each do |i|
            curr = comp[i]
            nex = comp[i+1]
            if curr > nex
                comp[i], comp[i+1] = nex, curr
            end
        end
        pass += 1
    end
    comp == arr
end

p is_sorted([1, 4, 10, 13, 15])       # => true
p is_sorted([1, 4, 10, 10, 13, 15])   # => true
p is_sorted([1, 2, 5, 3, 4 ])         # => false
