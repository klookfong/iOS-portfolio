# Examples
# no_dupes?([1, 1, 2, 1, 3, 2, 4])         # => [3, 4]
# no_dupes?(['x', 'x', 'y', 'z', 'z'])     # => ['y']
# no_dupes?([true, true, true])            # => []
def no_dupes?(arr)
    counter = Hash.new(0)
    dupe_arr = []
    arr.each { |e| counter[e] += 1  }
    counter.keys.each { |k| dupe_arr << k if counter[k] == 1 }
    dupe_arr
end


# # Examples
# no_consecutive_repeats?(['cat', 'dog', 'mouse', 'dog'])     # => true
# no_consecutive_repeats?(['cat', 'dog', 'dog', 'mouse'])     # => false
# no_consecutive_repeats?([10, 42, 3, 7, 10, 3])              # => true
# no_consecutive_repeats?([10, 42, 3, 3, 10, 3])              # => false
# no_consecutive_repeats?(['x'])                              # => true
def no_consecutive_repeats?(arr)
    return true if arr.length == 1
    arr.each_with_index do |e,i|
        return false if e == arr[i+1]
    end
    true
end

# # Examples
# char_indices('mississippi')   # => {"m"=>[0], "i"=>[1, 4, 7, 10], "s"=>[2, 3, 5, 6], "p"=>[8, 9]}
# char_indices('classroom')     # => {"c"=>[0], "l"=>[1], "a"=>[2], "s"=>[3, 4], "r"=>[5], "o"=>[6, 7], "m"=>[8]}
def char_indices(str)
    hash = {}
    str.each_char { |c| hash[c] = [] }
    str.each_char.with_index do |c,i|
        hash[c] << i
    end
    hash
end


# # Examples
# longest_streak('a')           # => 'a'
# longest_streak('accccbbb')    # => 'cccc'
# longest_streak('aaaxyyyyyzz') # => 'yyyyy
# longest_streak('aaabbb')      # => 'bbb'
# longest_streak('abc')         # => 'c'
def longest_streak(str)
    return str if str.length == 1
    arr = []
    str[0...-1].each_char.with_index do |c,i|
        streak = c
        j = i+1
        while str[i] == str[j]
            streak += c
            j+=1 
        end
        arr << streak
    end
    longest = ""
    arr.each { |e| longest = e if e.length >= longest.length }
    return longest
end



# bi_prime?(14)   # => true
# bi_prime?(22)   # => true
# bi_prime?(25)   # => true
# bi_prime?(94)   # => true
# bi_prime?(24)   # => false
# bi_prime?(64)   # => false
def bi_prime?(n)
    primes = (2..n/2).select {|num| prime?(num) }
    primes.each { |prime| return true if primes.any? { |nums| nums*prime == n } }
    return false
end

def prime?(n)
    (2..n/2).each { |num| return false if n%num==0 }
    true
end


def vigenere_cipher(msg, keys)
    new_msg = ""
    alphabet = "abcdefghijklmnopqrstuvwxyz".split("")
    msg.each_char.with_index do |char,i|
        start = alphabet.index(char)
        n_pos = start + keys[i % keys.length]
        new_msg += alphabet[n_pos % alphabet.length]
    end
    new_msg
end

def vowel_rotate(str)
    vowels = "aeiou".split("")
    str_copy = str[0..-1]
    v_i = (0...str.length).select { |i| vowels.include?(str[i]) }
    n_v_i = v_i.rotate(-(v_i.length-1))
    p v_i
    p n_v_i
    n_v_i.each_with_index do |v, i|
        str_copy[v] = str[v_i[i]]
    end
    str_copy
end

class String
    def select(&prc)
        return "" if prc.nil?
        n_str = ""
        self.each_char do |c|
            n_str += c if prc.call(c)
        end
        n_str
    end

    def map!(&prc)
        self.each_char.with_index do |c, i|
            self[i] = prc.call(c,i)
        end
    end
end


def multiply(base, pow)
    return 0 if pow == 0
    return base + multiply(base, pow-1) if pow > 0
    return -base + multiply(base, pow+1) if pow < 0
end


def lucas_sequence(length)
    return [] if length == 0
    return [2] if length == 1
    return [2,1] if length == 2
    seq = lucas_sequence(length-1)
    seq << seq[-1] + seq[-2]
    seq
end

def prime_factorization(num)
    (2...num).each do |f|
        if num % f  == 0
            other_fact = num / f
            return [ *prime_factorization(f), *prime_factorization(other_fact)]
        end
    end
    return [num]
end
p prime_factorization(12)