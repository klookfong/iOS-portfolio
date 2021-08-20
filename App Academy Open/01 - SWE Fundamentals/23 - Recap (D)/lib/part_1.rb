def is_prime?(num)
    return false if num < 2
    (2...num).each { |n| return false if num % n == 0 }
    true
end

def nth_prime(n)
    arr = []
    i = 1
    while arr.length < n
        arr << i if is_prime?(i)
        i += 1
    end
    arr[-1]
end

def prime_range(min, max)
    arr = []
    (min..max).each { |n| arr << n if is_prime?(n) } 
    arr
end