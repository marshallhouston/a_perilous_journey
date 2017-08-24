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

  def append(surname, supplies)
    @count += 1
    if @head == nil
      @head = Node.new(surname, supplies)
    elsif count == 1
      @head.next_node = Node.new(surname, supplies)
    else
      current_node = @head
      while current_node.next_node != nil
        current_node = current_node.next_node
      end
      current_node.next_node = Node.new(surname, supplies)
    end
  end

  def prepend(surname, supplies)
    @count += 1
    detached_nodes = @head
    @head = Node.new(surname, supplies)
    @head.next_node = detached_nodes
  end

  def insert(node_index, surname, supplies)
    @count += 1
    inserted_node = Node.new(surname, supplies)
    current_node = @head
    (node_index - 1).times do
      current_node = current_node.next_node
    end
    detached_nodes = current_node.next_node
    current_node.next_node = inserted_node
    inserted_node.next_node = detached_nodes
  end

  def find(position, number_of_families)
    current_node = @head

    position.times do
      current_node = current_node.next_node
    end

    collected_family_names = Array.new

    number_of_families.times do
      collected_family_names << current_node.surname
      current_node = current_node.next_node
    end

    if collected_family_names.count == 1
      name_only = collected_family_names.map do |name|
        "The #{name} family"
      end
      name_only[0]
    else
      first_name_only = collected_family_names[0]
      all_other_names = collected_family_names.drop(1)
      other_names_in_strings = all_other_names.map do |name|
        ", followed by the #{name} family"
      end
      "The #{first_name_only} family#{other_names_in_strings.join}"
    end
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

  def family_surnames_in_order
    current_node = @head
    family_surnames = Array.new
    while current_node != nil
      family_surnames << current_node.surname
      current_node = current_node.next_node
    end
    family_surnames
  end

  def to_string
    num_of_names = family_surnames_in_order.count
    families_in_a_string = family_surnames_in_order[1, (num_of_names - 1)].map do |surname|
      ", followed by the #{surname} family"
    end.join

    current_node = @head
    if current_node.next_node == nil
      "The #{@head.surname} family"
    else
      "The #{@head.surname} family#{families_in_a_string}"
    end
  end

  def includes?(surname)
    current_node = @head

    while current_node != nil
      if current_node.surname == surname
        return true
      else
        return false
      end
      current_node = current_node.next_node
    end

  end

  def pop
    current_node = @head
    while current_node.next_node != nil
      current_node = current_node.next_node
    end
    node_to_pop = current_node

    current_node = @head
    until current_node.next_node == node_to_pop
      current_node = current_node.next_node
    end
    node_to_reassign_next_value = current_node
    node_to_reassign_next_value.next_node = nil

    "The #{node_to_pop.surname} family has died of dysentery"
  end

end
