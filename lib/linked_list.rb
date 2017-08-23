require 'pry'
require './lib/node'

class LinkedList
  attr_accessor :head, :next_node, :count, :current_node

  def initialize
    @head = nil
    @next_node
    @current_node = @head
    @count = 0
  end

  def append(surname)
    @count += 1
    if @head == nil
      @head = Node.new(surname)
    elsif count == 1
      @head.next_node = Node.new(surname)
    else
      current_node = @head
      while current_node.next_node != nil
        current_node = current_node.next_node
      end
      current_node.next_node = Node.new(surname)
    end
  end

  def prepend(surname)
    @count += 1
    detached_nodes = @head
    @head = Node.new(surname)
    @head.next_node = detached_nodes
  end

  def insert(node_index, surname)
    @count += 1
    inserted_node = Node.new(surname)
    @current_node = @head
    (node_index - 1).times do
      current_node = @current_node.next_node
    end
    detached_nodes = current_node.next_node
    current_node.next_node = inserted_node
    inserted_node.next_node = detached_nodes
  end

  def find_total_number_of_nodes
    number_of_nodes = 0
    current_node = @head
    if @head != nil
      number_of_nodes += 1
    end
    while current_node.next_node != nil
      number_of_nodes += 1
      current_node = current_node.next_node
    end
    number_of_nodes
  end

  # def family_name_order
  #   current_node = @head
  #   family_names = Array.new
  #   while curent_node != nil
  #     family_names << current_node.next_node.surname
  #   end
  #   family_names
  # end

  def to_string
    current_node = @head
    if current_node.next_node == nil
      "The #{@head.surname} family"
    else
      "The #{@head.surname} family, followed by the #{@head.next_node.surname} family."
    end
  end

end
