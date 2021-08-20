def all_words_capitalized?(arr)
    arr.all? do |ele| 

        ele == ele[0].upcase + ele[1..-1].downcase 
    end
end


def no_valid_url?(arr)
    valid = ['com', 'net', 'io', 'org']
    arr.none? do |ele|  
        valid.include?(ele.split(".")[1])
    end
end

def any_passing_students?(arr)
    arr.any? do |ele|
        avg = ele[:grades].sum / ele[:grades].length
        avg >= 75
    end
end