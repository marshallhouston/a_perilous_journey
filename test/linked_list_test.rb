require 'minitest/autorun'
require 'minitest/pride'
require './lib/linked_list'
require 'pry'

class TestLinkedList < MiniTest::Test
  def test_linked_list_exists
    list = LinkedList.new

    assert_instance_of LinkedList, list
  end

  def test_head_method_exists_and_is_nil_by_default
    list = LinkedList.new

    list.head

    assert_nil @head
  end

  def test_append_makes_instance_of_node
    list = LinkedList.new

    assert_instance_of Node, list.append("West")
  end

  def test_append_adds_new_node
    list = LinkedList.new

    node = list.append("West")

    assert_equal "West", node.surname
  end

  def test_append_makes_node_with_next_node_as_nil
    list = LinkedList.new

    node = list.append("South")

    assert_nil node.next_node
  end

  def test_head_is_not_nil_after_appending_new_node
    list = LinkedList.new

    node = list.append("Rodriguez")

    refute nil, list.head
  end

  def test_list_can_count_elements
    list = LinkedList.new

    list.append("Saban")

    assert_equal 1, list.count
  end

  def test_tells_the_name_of_the_node
    list = LinkedList.new

    list.append("Bakke")

    assert_equal "The Bakke family", list.to_string
  end

  def test_second_append_is_an_instance_of_node
    list = LinkedList.new

    list.append("Longmuirs")

    assert_instance_of Node, list.append("Childs")
  end

  def test_node_after_head_is_not_nil_after_second_append
    list = LinkedList.new

    list.append("Longmuirs")
    list.append("Childs")

    refute_nil list.head.next_node
  end


  def test_second_append_assigns_second_name_to_node_after_head
    list = LinkedList.new

    list.append("Chaplin")
    list.append("Joyce")

    assert_equal "Joyce", list.head.next_node.surname
  end

  def test_count_is_two_after_two_appends
    list = LinkedList.new

    list.append("Chaplin")
    list.append("Joyce")

    assert_equal 2, list.count
  end

  def test_tells_which_families_are_in_the_list
    list = LinkedList.new

    list.append("Chaplin")
    list.append("Joyce")

    assert_equal "The Chaplin family, followed by the Joyce family.", list.to_string
  end

  def test_prepend_adds_to_beginning_and_still_maintains_other_nodes
    list = LinkedList.new

    list.append("Saban")
    list.append("Pruitt")
    list.prepend("Bryant")

    assert_equal "Bryant", list.head.surname
  end

  def test_prepend_stays_head_with_nodes_appended_after
    list = LinkedList.new

    list.append("Saban")
    list.append("Pruitt")
    list.prepend("Bryant")
    list.append("Stallings")
    list.append("Lupoi")

    assert_equal "Bryant", list.head.surname
  end

  def test_count_is_five_after_appends_and_prepend
    list = LinkedList.new

    list.append("Saban")
    list.append("Pruitt")
    list.prepend("Bryant")
    list.append("Stallings")
    list.append("Lupoi")

    assert_equal 5, list.count
  end

  # def test_if_the_next_node_is_nil
  #   list = LinkedList.new
  #
  #   list.append("Greg")
  #
  #   refute_nil list.head
  #   assert_nil list.head.next_node
  #
  # end

  def test_insert_into_position_after_head
    list = LinkedList.new

    list.append("Brooks")
    list.append("Henderson")

    assert_instance_of Node, list.insert(1, "Lawson")
    assert_equal "Lawson", list.head.next_node.surname
  end

  def test_insert_into_a_different_position
    list = LinkedList.new

    list.append("Lacy")
    list.append("Henry")
    list.append("Richardson")
    list.append("Ingram")

    assert_instance_of Node, list.insert(3, "Yeldon")
    assert_equal 5, list.find_total_number_of_nodes
    assert_equal 5, list.count
  end

  # def test_family_name_order_outputs_name_only
  #   list = LinkedList.new
  #
  #   list.append("Lacy")
  #   list.append("Henry")
  #   list.append("Richardson")
  #   list.append("Ingram")
  #
  #   assert_equal ["Henry", "Richardson", "Ingram"], list.family_name_order
  # end

end
