class Array

    def quicksort
        return self.dup if self.length <= 1
        pivot = self.first 
        left = self.drop(1).select { |el| el < pivot }
        right = self.drop(1).select { |el| el >= pivot }
        sorted_left = left.quicksort
        sorted_right = right.quicksort
        sorted_left + [pivot] + sorted_right
    end

    def add_numbers
        return 0 if self.length == 0
        return self.first if self.length == 1
        return self.first + self.drop(1).add_numbers
    end

    def ice_cream_shop(flavor)
        return false if self.length == 0
        return true if self.first == flavor 
        self.drop(1).ice_cream_shop(flavor)
    end
end

def sum_to(num)
    return 0 if num <= 0
    return num + sum_to(num-1)
end

def gamma(n)
    num = n - 1 
    return 0 if num <= 0
    return 1 if num == 1
    return num * gamma(num)

end


def reverse_string(str)
    return str if str.length <= 1
    return str[-1] + reverse_string(str[0...-1])
end
