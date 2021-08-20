def strange_sums(arr)
    hash = Hash.new(0)
    total = 0
    arr.each do |n|
        diff = -n
        hash[diff] += 1
        total += 1 if hash[n] > 0
    end
    total
end

def pair_product(nums, p)
    hash = Hash.new(0)
    nums.each do |n|
        div = p/n
        return true if hash[n] > 0
        hash[div] += 1
    end
    false
end

def rampant_repeats(str, hash)
    new_str = ""
    str.each_char do |char|
        appending = char
        appending *= hash[char] if hash.has_key?(char)
        new_str += appending
    end
    new_str
end

def perfect_square(num)
    (0..num).each { |n| return true if n * n == num }
    false
end

#helper
def factors(n)
    (1..n).select { |i| n % i == 0 }
end
def anti_prime?(num)
    amt = factors(num).length
    (1...num).all? { |i| amt > factors(i).length }
end


def matrix_addition(a1, a2)
    h = a1.length
    w = a1[0].length
    rslt = Array.new(h) { [0] * w }
    (0...h).each do |r|
        (0...w).each do |c|
            rslt[r][c] = a1[r][c] + a2[r][c]
        end
    end
    rslt
end


def mutual_factors(*nums)
    arr = []
    (1..nums.min).each do |n|
        arr << n if nums.all? { |i| i % n == 0 }
    end
    arr
end

def tribonacci_number(n)
    table = [1,1,2]
    return table[n-1] if n <= 3 
    (n-3).times do |n| 
        table << table.sum
        table.shift
    end
    table[-1]
end

