require './lib/linked_list'

class WagonTrain
  attr_accessor :list

  def initialize
    @list = LinkedList.new
  end

  def append(surname, supplies)
    list.append(surname, supplies)
  end

  def count
    list.count
  end

  def supplies
    current_node = list.head
    array_of_supplies = Array.new
    count.times do
      array_of_supplies << current_node.supplies
      current_node = current_node.next_node
    end

    supplies_hash = Hash.new(0)

    array_of_supplies.each do |supply_element|
      supply_element.each do |k, v|
          if supplies_hash.has_key?(k)
            supplies_hash[k] += v
          else
            supplies_hash[k] = v
          end
        end
    end
    supplies_hash

  end

end
