def my_map(arr, &prc)
    arr.each_with_index { |ele, i| arr[i] = prc.call(ele) }
end

def my_select(arr, &prc)
    newArr = []
    arr.each { |ele| newArr << ele if prc.call(ele) } 
    newArr
end

def my_count(arr, &prc)
    total = 0
    arr.each { |ele| total += 1 if prc.call(ele) }
    total
end

def my_any?(arr, &prc)
    flag = false
    arr.each { |ele| flag=true if prc.call(ele) }
    flag
end


def my_all?(arr, &prc)
    flag = true
    arr.each { |ele| flag=false if !prc.call(ele) }
    flag
end

def my_none?(arr, &prc)
    flag = true
    arr.each { |ele| flag=false if prc.call(ele) }
    flag
end