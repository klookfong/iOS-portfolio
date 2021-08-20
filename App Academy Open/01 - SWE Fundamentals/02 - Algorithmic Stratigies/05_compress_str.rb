# Write a method, compress_str(str), that accepts a string as an arg.
# The method should return a new str where streaks of consecutive characters are compressed.
# For example "aaabbc" is compressed to "3a2bc".

def compress_str(str)
    arr = str.split("") #split array
    nstr = "" #string to be returned
    i = 0 #index 
    while i < arr.length # while loop
        j = i #assigning j to index
        while arr[i] == arr[j+1] #if the next letter is the same
            j += 1 #add to j, keep tabs and keep index
        end
        if j == i #if only one streak
            nstr += arr[i]
        else 
            nstr += "#{j+1-i}#{arr[i]}" #(starts from 0) and subtract i for amount of times
        end
        i = j+1 #go to next index
    end
    nstr
end


p compress_str("aaabbc")        # => "3a2bc"
p compress_str("xxyyyyzz")      # => "2x4y2z"
p compress_str("qqqqq")         # => "5q"
p compress_str("mississippi")   # => "mi2si2si2pi"
