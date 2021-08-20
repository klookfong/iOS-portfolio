$arr = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']


#sluggish octopus, O(n^2)
def sluggish
    longest = nil
    $arr.each do |ele|
        $arr.each do |e|
            longest = e if e.length > ele.length
        end
    end
    longest
end
 
p "Sluggish: #{sluggish}"

#dominant octopus, O(nlogn)
def dominant(arr)
    return arr.dup if arr.length <= 1
    pivot = arr.first 
    left = arr.drop(1).select { |el| el.length < pivot.length }
    right = arr.drop(1).select { |el| el.length >= pivot.length }
    sorted_left = dominant(left)
    sorted_right = dominant(right)
    sorted_left + [pivot] + sorted_right
end

p "Dominant: #{dominant($arr)[-1]}"



#clever octopus, O(n)
def clever
    longest = ""
    $arr.each do |ele|
        longest = ele if ele.length > longest.length
    end
    longest
end

p "Clever: #{clever}"


$tiles_array = ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up" ]

$tiles_hash = {
    "up" => 0,
    "right-up" => 1,
    "right"=> 2,
    "right-down" => 3,
    "down" => 4,
    "left-down" => 5,
    "left" => 6,
    "left-up" => 7
}


def slow_dance(move, arr)
    arr.each_with_index { |ele, i| return i if ele == move}
end

p "Slow Dance: #{slow_dance("left", $tiles_array)}"

def fast_dance(move, hash)
    hash[move]
end

p "Fast Dance: #{fast_dance("left", $tiles_hash)}"
