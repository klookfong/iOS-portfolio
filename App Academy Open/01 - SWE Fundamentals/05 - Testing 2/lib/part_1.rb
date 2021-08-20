$vowels = ["a", "e", "i", "o", "u"]

def partition(arr, n)
    less = []
    greater_eq = []
    arr.each do |ele|
        less << ele if ele < n
        greater_eq << ele if ele >= n
    end
    [less, greater_eq]
end

def merge(h1,h2)
    h = Hash.new(0)
    h1.each do |k,v|
        h[k] = v
    end
    h2.each do |k,v|
        h[k] = v
    end
    h
end

def censor(sen, curses)
    new_sen = []
    sen.split(" ").each do |word|
        if curses.include?(word.downcase) 
            word.each_char.with_index do |char, i|
                word[i] = "*" if $vowels.include?(char.downcase)
            end
        end
        new_sen << word
    end
    new_sen.join(" ")
end

def power_of_two?(n)
    return true if n == 1 #2^0
    i = 1
    num = 2
    while i != n/2
        num *= 2
        return true if num == n
        i += 1
    end
    false
end