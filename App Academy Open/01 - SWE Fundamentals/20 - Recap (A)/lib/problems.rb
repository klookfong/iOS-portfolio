# Write a method, all_vowel_pairs, that takes in an array of words and returns all pairs of words
# that contain every vowel. Vowels are the letters a, e, i, o, u. A pair should have its two words
# in the same order as the original array. 
#
# Example:
#
# all_vowel_pairs(["goat", "action", "tear", "impromptu", "tired", "europe"])   # => ["action europe", "tear impromptu"]
def all_vowel_pairs(words)
    vowels="aeiou".split("")
    pairs=[]
    words.each_with_index do |ele, i|
        words.each_with_index do |e, j|
            pair = ele + " " +  e
            pairs << pair if j > i && vowels.all? { |v| pair.include?(v) } 
        end
    end
    pairs
end


# Write a method, composite?, that takes in a number and returns a boolean indicating if the number
# has factors besides 1 and itself
#
# Example:
#
# composite?(9)     # => true
# composite?(13)    # => false
def composite?(num)
    (2...num).each { |n| return true if num%n==0 }
    return false
end


# A bigram is a string containing two letters.
# Write a method, find_bigrams, that takes in a string and an array of bigrams.
# The method should return an array containing all bigrams found in the string.
# The found bigrams should be returned in the the order they appear in the original array.
#
# Examples:
#
# find_bigrams("the theater is empty", ["cy", "em", "ty", "ea", "oo"])  # => ["em", "ty", "ea"]
# find_bigrams("to the moon and back", ["ck", "oo", "ha", "at"])        # => ["ck", "oo"]
def find_bigrams(str, bigrams)
    arr = []
    arr2=[]
    str[0...-1].each_char.with_index do |e, i|
        arr << e + str[i+1]if bigrams.include?(e + str[i+1])
    end
    bigrams.each { |bigram| arr2 << bigram if arr.include?(bigram) }
    arr2
end

class Hash
    # Write a method, Hash#my_select, that takes in an optional proc argument
    # The method should return a new hash containing the key-value pairs that return
    # true when passed into the proc.
    # If no proc is given, then return a new hash containing the pairs where the key is equal to the value.
    #
    # Examples:
    #
    # hash_1 = {x: 7, y: 1, z: 8}
    # hash_1.my_select { |k, v| v.odd? }          # => {x: 7, y: 1}
    #
    # hash_2 = {4=>4, 10=>11, 12=>3, 5=>6, 7=>8}
    # hash_2.my_select { |k, v| k + 1 == v }      # => {10=>11, 5=>6, 7=>8})
    # hash_2.my_select                            # => {4=>4}
    def my_select(&prc)
        prc ||= Proc.new { |k,v| k==v }
        new_hash = {}
        self.each do |k,v|
            new_hash[k] = v if prc.call(k,v)
        end  
        new_hash
    end
end

class String
    # Write a method, String#substrings, that takes in a optional length argument
    # The method should return an array of the substrings that have the given length.
    # If no length is given, return all substrings.
    #
    # Examples:
    #
    # "cats".substrings     # => ["c", "ca", "cat", "cats", "a", "at", "ats", "t", "ts", "s"]
                            # => ["cats", "cat", "ca", "c", "a", "at", "t", "ats", "ts", "s"]
    # "cats".substrings(2)  # => ["ca", "at", "ts"]
    def substrings(length = nil)
        all = get_substrings(self)
        return all if !length
        return all.select { |ele| ele.length == length }
    end

    def get_substrings(str, arr=[])
        # add initially to array
        arr << str
        return str if str.length == 1
            
        
        #get all subarrays with all except last
        get_substrings(str[0...-1], arr)

        # get all subarrays with all but first
        get_substrings(str[1..-1], arr)

        return arr.uniq
    end
    # "cats" => ca + ts => c + a & t + s
    # substrings = [cats, cat, ca, c, ats, at, a, ts, t, s]

    # Write a method, String#caesar_cipher, that takes in an a number.
    # The method should return a new string where each char of the original string is shifted
    # the given number of times in the alphabet.
    #
    # Examples:
    #
    # "apple".caesar_cipher(1)    #=> "bqqmf"
    # "bootcamp".caesar_cipher(2) #=> "dqqvecor"
    # "zebra".caesar_cipher(4)    #=> "difve"
    def caesar_cipher(num)
        alphabet = "abcdefghijklmnopqrstuvwxyz"
        # remainder division => 10 % 26 = 10
        word=""
        range = alphabet.length
        self.each_char do |char|
            # finding the index in the alphabet
            i = alphabet.index(char)
            i += num
            i = i % range
            word += alphabet[i]
        end
        word
    end
end

p String.new.get_substrings("cats")