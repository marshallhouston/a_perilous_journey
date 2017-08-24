require './lib/linked_list'

class WagonTrain
  attr_accessor :list

  def initialize
    @list = LinkedList.new
  end

  def append(surname)
    list.append(surname)
  end

  def count
    list.count
  end

end
