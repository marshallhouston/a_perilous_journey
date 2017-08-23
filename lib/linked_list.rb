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
    current_node = @head
    (node_index - 1).times do
      current_node = current_node.next_node
    end
    detached_nodes = current_node.next_node
    current_node.next_node = inserted_node
    inserted_node.next_node = detached_nodes
  end

  def find(position, number_of_families)
    # move to the correct position in the list
    current_node = @head

    position.times do
      current_node = current_node.next_node
    end
    # collect number of family names equal to the amount passed in
    collected_family_names = Array.new

    number_of_families.times do
      collected_family_names << current_node.surname
      current_node = current_node.next_node
    end
    if collected_family_names.count == 1
      name_only = collected_family_names.map do |name|
        "The #{name} family"
      end
      name_only[0] #returning the first position of the array. so bad, so bad.
    else
      first_name_only = collected_family_names[0]
      all_other_names = collected_family_names.drop(1)
      other_names_in_strings = all_other_names.map do |name|
        ", followed by the #{name} family"
      end
      "The #{first_name_only} family#{other_names_in_strings.join}"
    end
    # to_string(collected_family_names)
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

end
