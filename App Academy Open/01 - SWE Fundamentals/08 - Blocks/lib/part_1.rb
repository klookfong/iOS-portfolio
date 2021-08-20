#1
def select_even_nums(arr)
    arr.select(&:even?)
end 

#2
def reject_puppies(arr)
    arr.reject{ |ele| ele["age"] < 3 }
end

#3
def count_positive_subarrays(arr)
    arr.count { |subArr| subArr.sum > 0 }
end

#4
$vowels = ["a", "e", "i", "o", "u"]

def aba_translate(str)
    arr = str.split("").map do |char| 
        string = char
        string = "#{char}b#{char}" if $vowels.include?(char) 
        string
    end
    arr.join("")
end


#5
def aba_array(arr)
    arr.map { |ele| aba_translate(ele) }
end