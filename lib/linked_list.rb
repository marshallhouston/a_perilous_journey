require 'pry'
require './lib/node'

class LinkedList
  attr_accessor :head, :next_node, :count, :current_node

  def initialize
    @head = nil
    @next_node = nil
    @current_node = @head
    @count = 0
  end

  def append(surname)
    @count += 1
    if @head == nil
      @head = Node.new(surname)
    else count = 1
      @head.next_node = Node.new(surname)
    end

  end

  def to_string
    if @head.next_node == nil
      "The #{@head.surname} family"
    else
      "The #{@head.surname} family, followed by the #{@head.next_node.surname} family."
    end
  end

end
