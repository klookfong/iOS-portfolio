def palindrome?(str)
    backwards = ""
    i = str.length - 1
    while i >= 0
        backwards += str[i]
        i -= 1
    end
    str == backwards
end

def substrings(str)
    arr = []
    str.each_char.with_index do |char, i|
        # getting all substrings
        j = i #not to reference same thing
        while j < str.length
            arr << str[i..j]
            j += 1
        end
    end
    arr
end

def palindrome_substrings(str)
    arr = []
    subs = substrings(str)
    subs.each do |ele| 
        if palindrome?(ele) && ele.length > 1
            arr << ele 
        end
    end
    arr
end

