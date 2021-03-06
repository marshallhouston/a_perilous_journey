require 'minitest/autorun'
require 'minitest/pride'
require './lib/linked_list'
require 'pry'

class TestLinkedList < Minitest::Test
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

    assert_instance_of Node, list.append("West", {"pounds of food" => 200})
  end

  def test_append_adds_new_node
    list = LinkedList.new

    node = list.append("West", {"pounds of food" => 200})

    assert_equal "West", node.surname
  end

  def test_append_makes_node_with_next_node_as_nil
    list = LinkedList.new

    node = list.append("South", {"pounds of food" => 200})

    assert_nil node.next_node
  end

  def test_head_is_not_nil_after_appending_new_node
    list = LinkedList.new

    node = list.append("Rodriguez", {"pounds of food" => 200})

    refute nil, list.head
  end

  def test_list_can_count_elements
    list = LinkedList.new

    list.append("Saban", {"pounds of food" => 200})

    assert_equal 1, list.count
  end

  def test_tells_the_name_of_the_node
    list = LinkedList.new

    list.append("Bakke", {"pounds of food" => 200})

    assert_equal "The Bakke family", list.to_string
  end

  def test_second_append_is_an_instance_of_node
    list = LinkedList.new

    list.append("Longmuirs", {"pounds of food" => 200})

    assert_instance_of Node, list.append("Childs", {"pounds of food" => 200})
  end

  def test_node_after_head_is_not_nil_after_second_append
    list = LinkedList.new

    list.append("Longmuirs", {"pounds of food" => 200})
    list.append("Childs", {"pounds of food" => 200})

    refute_nil list.head.next_node
  end


  def test_second_append_assigns_second_name_to_node_after_head
    list = LinkedList.new

    list.append("Chaplin", {"pounds of food" => 200})
    list.append("Joyce", {"pounds of food" => 200})

    assert_equal "Joyce", list.head.next_node.surname
  end

  def test_count_is_two_after_two_appends
    list = LinkedList.new

    list.append("Chaplin", {"pounds of food" => 200})
    list.append("Joyce", {"pounds of food" => 200})

    assert_equal 2, list.count
  end

  def test_tells_which_families_are_in_the_list
    list = LinkedList.new

    list.append("Chaplin", {"pounds of food" => 200})
    list.append("Joyce", {"pounds of food" => 200})

    assert_equal "The Chaplin family, followed by the Joyce family.", list.to_string
  end

  def test_prepend_adds_to_beginning_and_still_maintains_other_nodes
    list = LinkedList.new

    list.append("Saban", {"pounds of food" => 200})
    list.append("Pruitt", {"pounds of food" => 200})
    list.prepend("Bryant", {"pounds of food" => 200})

    assert_equal "Bryant", list.head.surname
  end

  def test_prepend_stays_head_with_nodes_appended_after
    list = LinkedList.new

    list.append("Saban", {"pounds of food" => 200})
    list.append("Pruitt", {"pounds of food" => 200})
    list.prepend("Bryant", {"pounds of food" => 200})
    list.append("Stallings", {"pounds of food" => 200})
    list.append("Lupoi", {"pounds of food" => 200})

    assert_equal "Bryant", list.head.surname
  end

  def test_count_is_five_after_appends_and_prepend
    list = LinkedList.new

    list.append("Saban", {"pounds of food" => 200})
    list.append("Pruitt", {"pounds of food" => 200})
    list.prepend("Bryant", {"pounds of food" => 200})
    list.append("Stallings", {"pounds of food" => 200})
    list.append("Lupoi", {"pounds of food" => 200})

    assert_equal 5, list.count
  end

  def test_insert_into_position_after_head
    list = LinkedList.new

    list.append("Brooks", {"pounds of food" => 200})
    list.append("Henderson", {"pounds of food" => 200})
    list.insert(1, "Lawson", {"pounds of food" => 200})

    assert_equal ["Brooks", "Lawson", "Henderson"],  list.family_surnames_in_order
  end

  def test_insert_into_a_different_position
    list = LinkedList.new

    list.append("Lacy", {"pounds of food" => 200})
    list.append("Henry", {"pounds of food" => 200})
    list.append("Ingram", {"pounds of food" => 200})
    list.insert(2, "Yeldon", {"pounds of food" => 200})

    assert_equal ["Lacy", "Henry", "Yeldon", "Ingram"], list.family_surnames_in_order
    assert_equal 4, list.find_total_number_of_nodes
    assert_equal 4, list.count
  end

  def test_family_names_stay_in_order_after_prepend
    list = LinkedList.new

    list.append("Lacy", {"pounds of food" => 200})
    list.append("Henry", {"pounds of food" => 200})
    list.append("Richardson", {"pounds of food" => 200})
    list.append("Ingram", {"pounds of food" => 200})
    list.prepend("Upchurch", {"pounds of food" => 200})

    assert_equal ["Upchurch", "Lacy", "Henry", "Richardson", "Ingram"], list.family_surnames_in_order
  end

  def test_tells_which_families_are_in_the_list
    list = LinkedList.new

    list.append("Lacy", {"pounds of food" => 200})
    list.append("Henry", {"pounds of food" => 200})
    list.append("Richardson", {"pounds of food" => 200})
    list.append("Ingram", {"pounds of food" => 200})

    assert_equal "The Lacy family, followed by the Henry family, followed by the Richardson family, followed by the Ingram family", list.to_string
  end

  def test_find_a_family_in_the_list
    list = LinkedList.new

    list.append("Lacy", {"pounds of food" => 200})
    list.append("Henry", {"pounds of food" => 200})
    list.append("Richardson", {"pounds of food" => 200})

    assert_equal "The Richardson family", list.find(2, 1)
  end

  def test_find_more_than_one_family
    list = LinkedList.new

    list.append("Lacy", {"pounds of food" => 200})
    list.append("Henry", {"pounds of food" => 200})
    list.append("Richardson", {"pounds of food" => 200})
    list.append("Ingram", {"pounds of food" => 200})

    assert_equal "The Henry family, followed by the Richardson family, followed by the Ingram family", list.find(1, 3)
  end

  def test_pop_removes_a_family
    list = LinkedList.new

    list.append("Lacy", {"pounds of food" => 200})
    list.append("Henderson", {"pounds of food" => 200})

    assert_equal "The Henderson family has died of dysentery",list.pop
  end

  def test_to_string_returns_correct_names_after_pop
    list = LinkedList.new

    list.append("Lacy", {"pounds of food" => 200})
    list.append("Henry", {"pounds of food" => 200})
    list.append("Richardson", {"pounds of food" => 200})
    list.append("Ingram", {"pounds of food" => 200})
    list.pop
    list.pop

    assert_equal "The Lacy family, followed by the Henry family", list.to_string
  end
end
