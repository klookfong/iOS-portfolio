class Code
  attr_reader :pegs
  POSSIBLE_PEGS = {
    "R" => :red,
    "G" => :green,
    "B" => :blue,
    "Y" => :yellow
  }
  def self.valid_pegs?(arr)
    arr.each { |ele| return false if !POSSIBLE_PEGS.has_key?(ele.upcase) }
    true
  end
  
  def initialize(arr)
    if Code.valid_pegs?(arr)
      @pegs = arr.map(&:upcase)
    else
      raise "The array does not contain valid pegs" 
    end
  end

  def self.random(length)
    arr=[]
    length.times { arr << POSSIBLE_PEGS.keys.sample }
    Code.new(arr)
  end

  def self.from_string(peg)
    arr = []
    peg.each_char { |char| arr << char if POSSIBLE_PEGS.has_key?(char.upcase) }
    Code.new(arr)
  end

  def [](index)
    @pegs[index]
  end

  def length
    @pegs.length
  end

  def num_exact_matches(code)
    total = 0
    code.pegs.each_with_index { |peg,i| total += 1 if peg == @pegs[i] }
    total
  end

  def num_near_matches(code)
    total = 0
    code.pegs.each_with_index { |peg,i| total += 1 if @pegs.include?(peg) && peg != @pegs[i] }
    total
  end

  def ==(code)
    @pegs==code.pegs
  end

end
