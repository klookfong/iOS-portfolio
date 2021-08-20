# Write a method, max_inject(arr), that accepts any amount of numbers arguments and returns
# the largest number. Solve this using the built-in inject.

def max_inject(*nums)
    #gets an unlimited amount of numbers
    nums.inject(0) do |acc, el| #for each number we start with accumulator of 0
        if el > acc #if the number is greater than accumulator, 
            acc = el #set acc equal to element
        end
        acc #return accumulator at the end
    end
end

p max_inject(1, -4, 0, 7, 5)  # => 7
p max_inject(30, 28, 18)      # => 30
