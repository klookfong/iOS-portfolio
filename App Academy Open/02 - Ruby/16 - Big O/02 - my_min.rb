def my_min_phase_one(arr)
    shortest = Float::INFINITY
    arr.each do |ele|
        arr.each do |e|
            shortest = e if e < shortest        
        end
    end
    shortest
end

def my_min_phase_two(arr)
    shortest = Float::INFINITY
    arr.each { |ele| shortest = ele if  ele <= shortest }
    shortest
end


$arr = [1,2,3,4,5,-2,-5,-10534875, 293480298, 234, 0, -12343145, -23435, -234145, -35425245646, -3524546, -426, 84905]
p "Phase Two: #{my_min_phase_two($arr)}"



def largest_contiguous_subsum1(array)
    subs = []
  
    array.each_index do |idx1|
      (idx1..array.length - 1).each do |idx2|
        subs << array[idx1..idx2]
      end
    end
  
    subs.map { |sub| sub.inject(:+) }.max
  end
  
def largest_contiguous_subsum2(arr)
largest = arr.first
current = arr.first

(1...arr.length).each do |i|
    current = 0 if current < 0
    current += arr[i]
    largest = current if current > largest
end

largest
end
