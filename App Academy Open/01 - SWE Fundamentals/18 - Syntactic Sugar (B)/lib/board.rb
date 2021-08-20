class Board
    attr_reader :size
    def initialize(n)
        @grid = Array.new(n) { Array.new(n, :N) }
        @size = n*n
    end
    def [](arr)
        @grid[arr[0]][arr[1]]
    end
    def []=(arr, val)
        @grid[arr[0]][arr[1]]=val
    end
    def num_ships
        total=0
        all_pos = @grid.flatten
        all_pos.each { |ele| total += 1 if ele == :S }
        total
    end
    def attack(arr)
        if self[arr] == :S
            puts "you sunk my battleship!"
            self[arr] = :H
            return true
        else
            self[arr] = :X
        end
        false
    end

    def place_random_ships
        total_ships = @size/4
        while self.num_ships < total_ships
            row = rand(0...@grid.length)
            col = rand(0...@grid.length)
            self[[row, col]] = :S
        end
    end

    def hidden_ships_grid
        new_grid = [] 
        @grid.each { |row| new_grid << self.hide_s(row)}
        new_grid
        
    end

    def hide_s(elem, arr=[])
        if elem.is_a?(Array)
            elem.each { |e| hide_s(e, arr) }
        else
            arr << :N if elem == :S
            arr << elem if elem != :S
        end
        return arr
    end

    def self.print_grid(grid)
        grid.each do |row|
           puts row.join(" ")
        end
    end
    def cheat
        Board.print_grid(@grid)
    end

    def print
        Board.print_grid(self.hidden_ships_grid)
    end
end
