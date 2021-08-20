class Player
    def get_move
        puts "enter a position with coordinates separated with a space like `4 7`"
        coords = gets.chomp
        arr = coords.split(" ").map { |e| e.to_i }
        arr
    end
end
