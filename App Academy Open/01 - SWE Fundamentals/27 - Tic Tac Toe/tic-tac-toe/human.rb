class HumanPlayer
    attr_reader :mark
    def initialize(mark)
        @mark = mark
    end
    def get_position(legal)
        puts "Input your position like with a space in between"
        puts "For example, 5 6"
        inp = gets
        inp = inp.split(" ")
        raise "Only input two numbers" if inp.length > 2 || inp.length < 0
        row = inp[0].to_i
        col = inp[1].to_i
        raise "Invalid or illegal position" if !legal.include?([row,col]) 
        [row, col]
    end
end