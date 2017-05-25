
class LinkedList
  def initialize
    @list = []
  end

  def append(data=nil)
    @list.push(Node.new(data))
    if @list.length > 1
      @list[-2].next_node = @list[-1]
    end
  end

  def preapend(data=nil)
    @list.unshift(Node.new(data))
    if @list.length > 1
      @list[0].next_node = @list[1]
    end
  end

  def size
    @list.length
  end

  def head
    @list.length == 0 ? nil : @list[0]
  end

  def tail
    @list.length == 0 ? nil : @list[-1]
  end

  def at(index)
    @list[index]
  end

  def pop
    @list.pop
    @list[-1].next_node = nil
  end

  def contains?(value)
    !(@list.all? {|node| node.value != value})
  end

  def find(data)
    position = nil
    @list.each_with_index do |node,index|
      if node.value == data
        position = index
      end
    end
    return position
  end

  def to_s
    if @list.length == 0
      return "nil"
    else
      str = ""
      @list.each {|node| str += ("("+node.value.to_s+") -> ")}
      str += "nil"
      return str
    end
  end

  def insert_at(data,index)
    @list.insert(index,Node.new(data,@list[index+1]))
    @list[index-1].next_node = @list[index]
  end

  def remove_at(index)
    @list[index-1].next_node = @list[index].next_node
    @list.delete_at(index)
  end

end

class Node
  attr_accessor :value, :next_node
  def initialize(value = nil,next_node = nil)
    @value = value
    @next_node = next_node

  end
end
