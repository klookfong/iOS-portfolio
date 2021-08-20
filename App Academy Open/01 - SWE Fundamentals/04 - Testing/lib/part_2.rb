
$vowels = ["a", "e", "i", "o", "u"]

def hipsterfy(str)
    
    arr = str.split("")
    #if vowels
    if arr.any? { |ele| $vowels.include?(ele) }
        last_vowel = 0
        arr.each_with_index do |ele, i|
            last_vowel = i if $vowels.include?(ele)
        end

        arr.delete_at(last_vowel)
        return arr.join("")
    end
    str
end

def vowel_counts(str)
    hash = Hash.new(0)
    str.each_char do |ele|
        hash[ele.downcase] += 1 if $vowels.include?(ele.downcase)
    end
    hash
end


def caesar_cipher(msg, n)
    alphabet = "abcdefghijklmnopqrstuvwxyz".split("")
    msg.each_char.with_index do |char, i|
        if alphabet.include?(char)
            old_idx = alphabet.index(char)
            old_idx += n
            new_idx = old_idx % alphabet.length
            msg[i] = alphabet[new_idx]
        end
    end
    msg
end

puts caesar_cipher("apple", 1)