def element_count(arr)
    hash = Hash.new(0)
    arr.each { |ele| hash[ele] += 1 }
    hash
end

def char_replace!(str, hash)
    str.each_char.with_index do |c,i|
        new_char = c
        if hash.has_key?(c)
            new_char = hash[c]
        end
        str[i] = new_char
    end
    str
end

def product_inject(arr)
    arr.inject(1) { |prod, n| prod *= n } 
end