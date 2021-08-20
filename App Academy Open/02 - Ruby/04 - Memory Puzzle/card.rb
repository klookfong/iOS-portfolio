class Card
    attr_accessor :val, :show
    def initialize(val)
        @val = val
        @show = false
    end

    def hide
        @show = false
    end

    def reveal
        @show = true
    end

    def ==(card)
        card.val == @val
    end

    def to_s
        str = " "
        str = @val if @show
        str
    end
    
end