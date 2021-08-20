def my_reject(arr, &blc)
    n_arr = []
    arr.each { |ele| n_arr << ele if !blc.call(ele) }
    n_arr
end

def my_one?(arr, &blc)
    total = 0
    arr.each { |e| total += 1 if blc.call(e) } 
    total == 1
end

def hash_select(hash, &blc)
    n_hash = {}
    hash.keys.each{ |key| n_hash[key] = hash[key] if blc.call(key, hash[key]) }
    n_hash
end

def xor_select(arr, prc1, prc2)
    n_arr = []
    arr.each do |ele|
        n_arr << ele if prc1.call(ele) && !prc2.call(ele)
        n_arr << ele if !prc1.call(ele) && prc2.call(ele)
    end
    n_arr
end

def proc_count(v, arr)
    total = 0
    arr.each { |prc| total += 1 if prc.call(v) }
    total
end