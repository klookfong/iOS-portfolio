# Monkey-Patch Ruby's existing Array class to add your own custom methods
class Array
    def span
        return nil if self.length == 0
        self.max - self.min
    end
    def average
        avg = nil
        avg = (1.0*self.sum) / self.length if self.length != 0
        avg
    end
    def median
        return nil if self.length == 0
        if self.length % 2 == 0
            return (self.sort[self.length/2-1] + self.sort[self.length/2])/2.0

        end
        return self.sort[(self.length/2).floor]
    end
    def counts
        hash = Hash.new(0)
        self.each { |ele| hash[ele] += 1 }
        hash
    end

    def my_count(ele)
        total = 0
        self.each { |e| total += 1 if ele == e }
        total
    end

    def my_index(ele)
        self.each_with_index do |e, i|
            return i if e == ele
        end
        nil
    end

    def my_uniq
        newArr = []
        self.each { |e| newArr << e if !newArr.include?(e) }
        newArr
    end

    def my_transpose
        newArr = Array.new(self[0].length) {Array.new()}
        self.each do |e|
            e.each_with_index do |ele, i|
                newArr[i] << ele
            end
        end
        newArr
    end
end
