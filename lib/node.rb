require 'pry'

class Node
attr_accessor :surname, :next_node, :position, :supplies

  def initialize(surname, supplies)
    @surname = surname
    @next_node = nil
    @supplies = supplies
  end

end
