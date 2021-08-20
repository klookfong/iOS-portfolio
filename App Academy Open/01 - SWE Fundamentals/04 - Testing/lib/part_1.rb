def average(n1, n2)
    (n1+n2)/2.0
end

def average_array(array)
    array.sum / (array.length*1.0)
end


def repeat(str, t)
    str_new = ""
    t.times { str_new += str }
    str_new
end


def yell(str)
    str.upcase + "!"
end


def alternating_case(str)
    arr = str.split(" ")
    arr.each_with_index do |ele, i|
        if i % 2 != 0
            arr[i] = ele.downcase
        else
            arr[i] = ele.upcase
        end
    end
    arr.join(" ")
end