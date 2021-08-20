



def bubblesort(*nums)
    passes = 0
    while passes < nums.length
        (0...nums.length-1).each do |i|
            curr = nums[i]
            nex = nums[i+1]
            if curr > nex
                nums[i], nums[i+1] = nex, curr
            end
        end
        passes += 1
    end
    return nums
end



p bubblesort(0,90,79,56,3245,4356,8,98,3,1,4,7,67,4,3,7,6,3,34,7,349,435,56,67,78,79,534,34,2,3,5,6,8,9,7,4,2,4,5,6,7,7,8,
    9,9,0,7,4,3,3,5,6,6,3453,45,34,5235345,34534534,234234234,12323,435453,34545646,3453454,3453453,345345)
    

