def zip(*arrs)
    n_arr = []
    #number of arrays
    len = arrs.length
    #getting all indexes
    (0...arrs[0].length).each do |i|
        subarr = []
        t=0
        while t<len
            subarr << arrs[t][i]
            t+=1
        end
        n_arr << subarr
    end
    n_arr
end

def prizz_proc(arr, prc1, prc2)
    n_arr = []
    arr.each do |ele|
        n_arr << ele if prc1.call(ele) && !prc2.call(ele)
        n_arr << ele if !prc1.call(ele) && prc2.call(ele)
    end
    n_arr
end

def zany_zip(*arrs)
    #getting the max length
    len = arrs.map(&:length).max
    (0...len).map do |i|
        arrs.map {|arr| arr[i]}
    end
end

def maximum(arr, &blc)
     return nil if arr.empty?
     max = arr.first
     arr.each do |e|
        max = e if blc.call(e) >= blc.call(max)
     end
     max
end

def my_group_by(arr, &blc)
    group = Hash.new { |hash,k| hash[k]=[] }
    arr.each do |e|
        group[blc.call(e)] << e
    end
    group
end

def max_tie_breaker(arr, prc, &blc)
    return nil if arr.length == 0
    max = arr[0]
    arr.each do |e|
        b_e = blc.call(e)
        m_e = blc.call(max)
        max = e if b_e > m_e
        if b_e == m_e
            b_e = prc.call(e)
            m_e = prc.call(max)
            max = e if b_e > m_e
        end 

    end
    max
end

def silly_syllables(sen)
    vowels = "aeiou".split("")
    words = sen.split(" ")
    revised = []
    words.each do |word|
        # get the indices of each vowel
        idx = []
        word.each_char.with_index { |c,i| idx << i if vowels.include?(c) }
        if idx.length < 2
            revised << word
        else
         revised << word[idx[0]..idx[-1]]
        end
    end
    revised.join(" ")
end