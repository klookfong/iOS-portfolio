# Write a method, coprime?(num_1, num_2), that accepts two numbers as args.
# The method should return true if the only common divisor between the two numbers is 1.
# The method should return false otherwise. For example coprime?(25, 12) is true because
# 1 is the only number that divides both 25 and 12.


def coprime?(n1, n2)
    f1 = []
    f2 = []

    #getting all divisors
    (2..n1/2).each do |num|
        if n1 % num == 0
            f1 << num
        end
    end

    #getting all divisors
    (2..n2/2).each do |num|
        if n2 % num == 0
            f2 << num
        end
    end

    #for all divisors in f1, if they are in f2, it is not coprime
    f1.each { |num| return false if f2.include?(num) }
    true

end

p coprime?(25, 12)    # => true
p coprime?(7, 11)     # => true
p coprime?(30, 9)     # => false
p coprime?(6, 24)     # => false
