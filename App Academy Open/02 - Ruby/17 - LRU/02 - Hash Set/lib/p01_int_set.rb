class MaxIntSet
  attr_reader :max, :store
  def initialize(max)
    @max = max
    @store = []
  end

  def insert(num)
    self.is_valid?(num)
    @store[num] = true
  end

  def remove(num)
    self.is_valid?(num)
    @store[num] = false
  end

  def include?(num)
    @store[num]
  end

  private

  def is_valid?(num)
    raise "Out of bounds" unless num <= @max && num >= 0
  end

  def validate!(num)
  end
end


class IntSet
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    return false if self.include?(num)
    self[num] << num
    true
  end

  def remove(num)
    self[num].delete(num)
  end

  def include?(num)
    self[num].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    @store[num % self.num_buckets]
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    return false if self.include?(num)
    self[num] << num 
    @count += 1
    self.resize! if num_buckets < self.count
    num
  end

  def remove(num)
    @count -= 1 if self[num].delete(num)
  end

  def include?(num)
    self[num].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    @store[num % self.num_buckets]
  end

  def num_buckets
    @store.length
  end

  def resize!
    s = @store 
    @count = 0 
    @store = Array.new(num_buckets * 2) { Array.new }
    s.flatten.each { |num| self.insert(num) }
  end

end
