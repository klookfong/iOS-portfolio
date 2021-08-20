class Item
    attr_accessor :title, :deadline, :desc, :done
    def initialize(title, deadline, desc)
        raise "Date is not valid!" if !Item.valid_date?(deadline)
        @title = title
        @deadline = deadline
        @desc = desc
        @done = false
    end

    def self.valid_date?(str)
        arr = str.split("-")
        return false if arr.length != 3
        # checking year
        return false if arr[0].length != 4
        #checking the month
        month = arr[1].to_i
        return false if month > 12 || month < 1
        #checking date
        day = arr[2].to_i
        return false if day > 31 || day < 1
        true    
    end

    def toggle
        @done = !@done
    end

end

