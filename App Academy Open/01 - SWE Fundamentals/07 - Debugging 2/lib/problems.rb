# Run `bundle exec rspec` and satisy the specs.
# You should implement your methods in this file.
# Feel free to use the debugger when you get stuck.


# 1

def prime?(num)
    return false if num < 2
    (2...num).each do |n|
        return false if num % n == 0
    end
    true
end

def largest_prime_factor(num)
    facts = []
    (1..num).each do |n|
        facts << n if (num % n == 0 && prime?(n))
    end
    facts[-1]
end


# 2

def unique_chars?(str)
    hash = Hash.new(0)
    str.each_char do |char|
        hash[char] += 1
    end
    hash.each { |k,v| return false if v > 1 }
    true
end

#3

def dupe_indices(arr)
    hash = Hash.new()
    arr.each { |ele| hash[ele] = [] }
    arr.each_with_index do |ele, i|
        hash[ele] << i
    end
    hash.select { |k,v| v.length > 1 }
end

puts dupe_indices(["a", "b", "c", "c", "b"])


#4

def ana_array(arr1, arr2)
    hash = Hash.new()
    arr1.each { |ele| hash[ele] = [0,0] }
    arr2.each { |ele| hash[ele] = [0,0] }
    arr1.each { |ele| hash[ele][0] += 1 }
    arr2.each { |ele| hash[ele][1] += 1 }
    all_eq = true
    hash.each { |k,v| all_eq = false if v[0] != v[1] }
    all_eq
end