class Computer
    attr_reader :mark
    def initialize(mark)
        @mark = mark
    end
    def get_position(posts)
        posts.sample
    end
end