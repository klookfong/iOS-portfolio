def proper_factors(num)
    arr = []
    (1..num/2).each { |n| arr << n if num%n==0 }
    arr
end

def aliquot_sum(n)
    factors = proper_factors(n)
    factors.sum
end

def perfect_number?(n)
    n == aliquot_sum(n)
end

def ideal_numbers(n)
    arr = []
    num = 1
    while arr.length < n
        arr << num if perfect_number?(num)
        num += 1
    end
    arr
end