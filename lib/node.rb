require 'pry'

class Node
attr_accessor :surname, :next_node, :position

  def initialize(surname)
    @surname = surname
    @next_node = nil
  end

end
