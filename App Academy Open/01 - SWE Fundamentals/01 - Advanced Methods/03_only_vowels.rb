# Write a method, `only_vowels?(str)`, that accepts a string as an arg.
# The method should return true if the string contains only vowels.
# The method should return false otherwise.


def only_vowels?(word)
    #all vowels
    vowels = ["a", "e", "i", "o", "u"]

    # if vowels does not include any character
    !word.split("").any? { |char| !vowels.include?(char) }
    #return the opposite (all vowels will be false so reverse)
end

p only_vowels?("aaoeee")  # => true
p only_vowels?("iou")     # => true
p only_vowels?("cat")     # => false
p only_vowels?("over")    # => false


