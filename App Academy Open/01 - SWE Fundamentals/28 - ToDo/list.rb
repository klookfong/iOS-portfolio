require_relative "item"

class List
    attr_accessor :label
    def initialize(label)
        @label = label
        @items = []
    end
    def add(title, deadline, desc="")
        return false if !Item.valid_date?(deadline)
        item = Item.new(title, deadline, desc)
        @items << item
        true
    end
    def size
        @items.length
    end
    def valid_index?(i)
        return false if i<0
        i < self.size
    end
    def swap(i,j)
        return false if !self.valid_index?(i) || !self.valid_index?(j)
        first = @items[i]
        second = @items[j]
        @items[i] = second
        @items[j] = first
        true
    end
    def [](idx)
        return nil if !self.valid_index?(idx)
        @items[idx]
    end
    def priority
        self.[](0)
    end
    def print
        len=60
        puts "-".center(len, "-")
        puts @label.center(len)
        puts "-".center(len, "-")
        puts "Index".ljust(6) + "| Item".ljust(30) + "| Deadline".ljust(14) + "| Status".ljust(10)
        puts "-".center(len, "-")
        @items.each_with_index do |item, i|
            puts "#{i}".ljust(6) + "| #{item.title}".ljust(30) + "| #{item.deadline}".ljust(14) + "| [#{item.done ? "✓" : ""}]".ljust(10)
        end
        puts "-".center(len, "-")
    end
    def print_item(i)
        len=60
        puts "-".center(len, "-")
        item = self.[](i)
        puts "#{item.title}".ljust(25) + "#{item.deadline}".rjust(25) + "| [#{item.done ? "✓" : ""}]".ljust(10)
        puts item.desc
        puts "-".center(len, "-")
    end
    def print_priority
        self.print_item(0)
    end
    def up(i, amt=self.size)
        return if !valid_index?(i)
        while amt > 0
            self.swap(i, i-1) if i > 0 
            i -= 1
            amt -= 1
        end
    end
    def down(i, amt=self.size)
        return if !valid_index?(i)
        while amt > 0
            self.swap(i, i+1) if i < self.size-1
            i += 1
            amt -= 1
        end
    end
    def sort_by_date
        @items.sort_by! { |item| item.deadline }
    end
    def toggle_item(i)
        self.[](i).toggle
    end
    def remove(i)
        return false if !self.valid_index?(i)
        @items.delete_at(i)
        true
    end
    def purge
        @items.select! {|item| !item.done }
    end
end

