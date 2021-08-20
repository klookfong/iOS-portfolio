def anagram?(w1, w2)
    w1_letter_hash = Hash.new(0)
    w1.each_char { |c| w1_letter_hash[c] += 1 }

    w2_letter_hash = Hash.new(0)
    w2.each_char { |c| w2_letter_hash[c] += 1 }

    flag = true
    w2.each_char { |c| flag = false if w2_letter_hash[c] != w1_letter_hash[c] }

    flag
end


p anagram?("gizmo", "sally")    #=> false
p anagram?("elvis", "lives")    #=> true
