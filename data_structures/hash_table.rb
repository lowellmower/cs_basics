# because of their flexibility, hash tables can often times
# lead to a correct but inefficient solution to a problem.
# Hash tables are effective in detecting duplicates in a list,
# counting elements in a stream, or search a pregenerated
# list, but they also have draw backs; they cannot be easily
# enumerated by key or value, collisions in the search space
# can degrade lookup performance, and there is a significant
# ammount of memory overhead for mapping key-value pairs and
# accounting for resizing upon any insert

class HashTable

  attr_accessor :entries

  def initialize(size, hash_fn = nil)
    alloc(size)
    @hash_fn = hash_fn
  end

  def insert(key, val)
    idx = hash_function(key) % @entries.size
    @entries[idx] = {key: key, value: val}
  end

  def [](key)
    index = hash_function(key) % @entries.size
    entry = @entries.fetch index, nil
    return entry[:value] if entry && entry[:key] == key
    nil
  end

  def resize!(size)
    old_entires = @entries
    alloc(size)
    old_entires.each do |e|
      insert(e[:key], e[:value]) if e
    end
  end

# used for both insertion and retrieval
  def hash_function(val)
    return @hash_fn.call(val) if @hash_fn
    complex_hash(val)
  end

# write a hash function in constant time
  def complex_hash(str)
    count = 16
    hash_val = 0
    str.each_char do |c|
      count -= 1
      break unless count > 0
      hash_val += (c.ord - 'a'.ord) << (count % 4)
    end
    hash_val
  end

  private

    def alloc(size)
      @entries = Array.new(size)
    end
# end private
end