


class Node 
    attr_accessor :ticker, :location
    def initialize(ticker, location)
        @ticker = ticker
        @location = location
    end
    def dist(node)
        distance_to_x = node.location[0] - @location[0]
        distance_to_y = node.location[1] - @location[1]
        distance_to_x.abs() + distance_to_y.abs()
    end
    def to_s
        "Ticker: #{@ticker} at #{@location}"
    end
end

class Graph
    attr_reader :matrix, :grid, :start, :end, :width, :length
    #matrix is what is printed, grid is populated with nodes
    def initialize(starting_position, ending_position, num_rows, num_columns)
        @matrix = get_chess_pieces(num_rows, num_columns)
        @grid = generate_grid(matrix)
        @start = nil
        @end = nil
        @grid.each do |row|
            row.each do |ele|
                @start = ele if ele.location == starting_position
                @end = ele if ele.location == ending_position
            end
        end
        raise "Undefined start or end points" if @start == nil || @end == nil
        raise "start and end points are equal" if @start == @end 
        @start.ticker = "S"
        @end.ticker = "E"
        @width = @grid[0].length
        @length = @grid.length
    end

    def get_chess_pieces(l, c)
        arr = []
        l.times do |t|
            app = []
            c.times do |j|
                app << " "
            end
            arr << app
        end
        arr
    end

    def generate_grid(mat)
        arr = []
        mat.each_with_index do |row, i|
            arr2 = []
            row.each_with_index do |ele, j|
                node = Node.new(ele, [i,j])
                arr2 << node
            end
            arr << arr2
        end
        arr
    end

    def loc(row,col)
        @grid[row][col]
    end

    def print_grid
        @grid.each_with_index do |row, i|
            print "#{i}:  "
            row.each_with_index do |ele, j|
                print "#{ele.ticker} " 
            end
            puts
        end
        print "   "
        (0...@grid[0].length).each { |i| print "#{i} " }
        puts
    end

    def print_grid_without_indicators
        @grid.each_with_index do |row, i|
            row.each_with_index do |ele, j|
                print "#{ele.ticker} " 
            end
            puts
        end
    end
    
    def update(row, col, ticker)
        @grid[row][col].ticker = ticker if !["E", "S"].include?(@grid[row][col].ticker)
    end

end

class Pathfinding
    def initialize(graph, char)
        @graph = graph
        @char = char
    end

    def bfs
        found = false
        #find starting and ending positions
        start = @graph.start
        finish = @graph.end
        
        #initialize a list of queue nodes
        queue = []
        queue << [start]

        #initialize an explored array
        explored = []

        paths = []
        
        #loop through each of the queue node's neighbors until end is reached
        while queue.length != 0
            #finding the element we are assessing
            path = queue.shift
            ele = path[-1] #last in path
            location = ele.location
            # find neighbors
            if !explored.include?(ele)
                neighbors = []
                
                # lets not have an index out of range error
                neighbors << @graph.loc(location[0], location[1]-1) if location[1]-1 >= 0 && location != start
                neighbors << @graph.loc(location[0], location[1]+1) if @graph.width > location[1]+1 && location != start
                neighbors << @graph.loc(location[0]-1, location[1]) if location[0]-1 >= 0 && location != start
                neighbors << @graph.loc(location[0]+1, location[1]) if @graph.length > location[0]+1 && location != start
                if !neighbors.nil? && neighbors != []
                    neighbors.each do |neighbor|
                        new_path = path.clone
                        new_path << neighbor
                        if neighbor == finish
                            paths << path
                        else
                            queue << new_path
                        end
                        
                    end
                end
                explored << ele
            end
        end
        if paths.length == 0
            puts "No path was found" 
        else
            path = paths.sort_by{ |arr| arr.length }
            path = path[0]
            puts "The shortest path is #{path.length} elements long" 
            path.each do |element|
                @graph.update(element.location[0], element.location[1], @char)
            end
            @graph.print_grid_without_indicators
        end
    end

    def print_paths(paths)
        paths.each do|path| 
            path.each { |e| print e.to_s }
            puts
        end
    end
end

g = Graph.new([0,0], [5,5], 10,10)
g.print_grid
path = Pathfinding.new(g,"*")
path.bfs

