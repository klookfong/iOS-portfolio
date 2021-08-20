class Array
    def my_each(&prc)
        self.length.times do |i|
            prc.call(self[i])
        end
        self #has to return the arr
    end

    def my_select(&prc)
        arr = []
        self.my_each { |e| arr << e if prc.call(e) }
        arr
    end

    def my_reject(&prc)
        arr = []
        self.my_each { |e| arr << e if !prc.call(e) } 
        arr
    end

    def my_any?(&prc)
        arr = self.my_select { |e| prc.call(e) }
        arr.length != 0
    end

    def my_all?(&prc)
        arr = self.my_select { |e| prc.call(e) }
        arr.length == self.length
    end

    def my_flatten(e=self, arr=[])
        if !e.is_a?(Array)
            arr << e
            return
        end
        e.my_each { |ele| my_flatten(ele, arr) }
        arr
    end

    def my_zip(*arrs)
        arr = []
        len = self.length
        while arr.length != len
            self.each_with_index do |e,i|
                append = []
                append << e
                arrs.each { |a| append << a[i] }
                arr << append
            end
        end
        arr
    end

    def my_rotate(t=1)
        arr = self.clone
        (t.abs).times do |i|
            #remove the element
            e = t >= 0 ? arr.shift : arr.pop
            #add the element
            t >= 0 ?  arr.push(e) : arr.unshift(e)
        end
        arr
    end
    
    def my_join(sep="")
        str = ""
        self.my_each { |e| str += "#{e}#{sep}" }
        str
    end

    def my_reverse
        arr=[]
        i = self.length - 1
        while i >= 0    
            arr << self[i]
            i -= 1
        end
        arr
    end
end
