def reverser(str, &prc)
    str = str.reverse!
    prc.call(str)
end


def word_changer(sentence, &prc)
    arr = sentence.split(" ")
    arr.each_with_index { |ele, i| arr[i] = prc.call(ele) }
    arr.join(" ")
end

def greater_proc_value(n, prc1, prc2)
    pc1 = prc1.call(n)
    pc2 = prc2.call(n)
    val = pc2
    val = pc1 if pc1 > pc2
    val
end

def and_selector(arr, prc1, prc2)
    arr.select do |ele|
        prc1.call(ele) && prc2.call(ele)
    end
end

def alternating_mapper(arr, prc1, prc2)
    arr.each_with_index do |ele, i|
        arr[i] = prc1.call(ele) if i.even?
        arr[i] = prc2.call(ele) if i.odd?
    end 
    arr
end