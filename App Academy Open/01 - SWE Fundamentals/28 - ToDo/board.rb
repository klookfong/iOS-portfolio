require_relative "item"
require_relative "list"

class Board
    def initialize(label)
        @lists = {}
    end

    def get_command
        puts "Put a command:"
        cmd, *args = gets.chomp.split(" ")
        key = args[0]
        case cmd
        when "mklist"
            list = List.new(key)
            @lists[key] = list
        when "ls"
            p @lists.keys
        when "showall"
            @lists.keys.each { |k| @lists[k].print }
        when "mktodo"
            @lists[key].add(*args[1..-1])
        when "up"
            @lists[key].up(*args[1..-1].map(&:to_i))
        when "down"
            @lists[key].down(*args[1..-1].map(&:to_i))
        when "swap"
            @lists[key].swap(*args[1..-1].map(&:to_i))
        when "sort"
            @lists[key].sort_by_date
        when "priority"
            @lists[key].print_priority
        when "print"
            args.length == 1 ? @lists[key].print : @lists[key].print_item(*args[1].to_i) 
        when "toggle"
            @lists[key].toggle_item(*args[1].to_i)
        when "rm"
            @lists[key].remove(*args[1].to_i)
        when "purge"
            @lists[key].purge
        when "quit"
            return false
        else
            p "Command not recognized"
        end
        true
    end

    def run
        flag = true
        while flag
            flag = get_command
        end
    end
end

board = Board.new("TESTING")
board.run