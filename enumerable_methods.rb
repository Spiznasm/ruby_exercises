module Enumerable


  def my_each
    for i in self
      yield i
    end
    self
  end

  def my_each_with_index
    for i in (0...self.length)
      yield self[i], i
    end
    self
  end

  def my_select
    selected = []
    self.my_each { |mem| selected<<mem if yield mem}

    selected
  end

  def my_all?
    if block_given?
      self.length == self.my_select {|mem| yield mem}.length
    else
      true
    end
  end

  def my_any?
    if block_given?
      self.my_select {|mem| yield mem}.length >0
    else
      true
    end
  end

  def my_none?
    if block_given?
      self.my_select {|mem| yield mem}.length == 0
    else
      false
    end
  end

  def my_count
    if block_given?
      self.my_select {|mem| yield mem}.length
    else
      self.length
    end
  end

  def my_map &block
    mapped = []
    self.my_each do |mem|
      mapped << block.call(mem)
    end
    return mapped
  end

  def my_inject(result = nil)
    if result == nil
      result = self[0]
      idx = 1
    else
      idx = 0
    end
    while idx < self.length
      result = yield(result,self[idx])
      idx += 1
    end
    result
  end

end

def multiply_els(arr)
  arr.my_inject {|x,y| x*y }
end
