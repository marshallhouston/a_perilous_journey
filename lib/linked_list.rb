require './lib/node'

class LinkedList
  attr_accessor :head

  def initialize
    @head = nil
  end

  def append(surname)
    node = Node.new(surname)
    if @head == nil
      @head = node
    end
  end

  def count
    current_node = @head
    count = 0
    while current_node != nil
      count += 1
      current_node = current_node.next_node
    end
      count
  end

  def to_string
    "The #{@head.surname} family"
  end

end
