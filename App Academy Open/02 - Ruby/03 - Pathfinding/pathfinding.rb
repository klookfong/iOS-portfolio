


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
end

class Graph
    attr_reader :matrix, :grid, :start, :end, :width, :length
    #matrix is what is printed, grid is populated with nodes
    def initialize(filename)
        @matrix = []
        File.open(filename).each_line do |line|
            chars = line.split(//)
            @matrix << chars
        end
        @grid = generate_grid(matrix)
        @start = nil
        @end = nil
        @grid.each do |row|
            row.each do |ele|
                @start = ele if ele.ticker == "S"
                @end = ele if ele.ticker == "E"
            end
        end
        raise "Undefined start or end points" if @start == nil || @end == nil
        raise "start and end points are equal" if @start == @end 
        @width = @grid[0].length
        @length = @grid.length
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
                neighbors << @graph.loc(location[0], location[1]-1) if location[1]-1 >= 0
                neighbors << @graph.loc(location[0], location[1]+1) if @graph.width >= location[1]+1
                neighbors << @graph.loc(location[0]-1, location[1]) if location[0]-1 >= 0
                neighbors << @graph.loc(location[0]+1, location[1]) if @graph.length >= location[0]+1

                neighbors = neighbors.select! { |ele| ele.ticker != "*" }
                if neighbors != nil
                    neighbors.each do |neighbor|
                        new_path = path.clone
                        new_path << neighbor
                        if neighbor == finish
                            paths << path
                            
                            # break
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
            path = path[-1]
            puts "The shortest path is #{path.length} elements long" 
            path.each do |element|
                @graph.update(element.location[0], element.location[1], @char)
            end
            @graph.print_grid_without_indicators
        end
    end
end

g = Graph.new("maze.txt")
g.print_grid
p g.length
p g.width
path = Pathfinding.new(g,"O")
path.bfs

