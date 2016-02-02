class LRUCache
  attr_reader :maximum

  def initialize maximum
    @maximum = maximum
    @store = Array.new
  end

  def put key, value
    put_item = {:key => key, :value => value}
    if @store.find {|x| x == put_item}
      @store.delete put_item
    end
    @store << put_item
    @store.shift if @store.size > maximum
    return
  end

  def get key
    found_item = @store.find {|x| x[:key] == key}
    if found_item
      put found_item[:key], found_item[:value]
      found_item[:value]
    else
      nil
    end
  end

  def to_s
    @store.join
  end
end
