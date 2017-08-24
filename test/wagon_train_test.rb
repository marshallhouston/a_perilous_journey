require 'minitest/autorun'
require 'minitest/pride'
require './lib/wagon_train'

class WagonTrainTest < Minitest::Test
  def test_wagon_train_exists
    wt = WagonTrain.new

    assert_instance_of WagonTrain, wt
  end

  def test_wagon_train_initialize_creates_new_list
    wt = WagonTrain.new

    assert_instance_of LinkedList, wt.list
  end

  def test_wagon_train_head_is_nil
    wt = WagonTrain.new

    assert_nil wt.list.head
  end

  def test_wagon_train_can_append_and_create_a_new_node
    wt = WagonTrain.new

    wt.append("Burke", {"pounds of food" => 200})

    assert_equal "Burke", wt.list.head.surname
  end

  def test_wagon_train_appends_and_returns_another_correct_name
    wt = WagonTrain.new

    wt.append("West", {"pounds of food" => 300})

    assert_equal "West", wt.list.head.surname
  end

  def test_wagon_train_can_count_the_number_of_nodes
    wt = WagonTrain.new

    wt.append("Burke", {"pounds of food" => 200})
    wt.append("West", {"pounds of food" => 300})

    assert_equal 2, wt.count
  end

  def test_append_adds_supplies_to_node
    wt = WagonTrain.new

    wt.append("Burke", {"pounds of food" => 200})

    assert_equal 200, wt.list.head.supplies["pounds of food"]
  end

  def test_prepend_adds_node_to_beginning_with_supplies_passed_in
    wt = WagonTrain.new

    wt.append("Burke", {"pounds of food" => 200})
    wt.list.prepend("Hardy", {"spare wagon tongues" => 3})

    assert_equal "Hardy", wt.list.head.surname
    assert_equal 3, wt.list.head.supplies["spare wagon tongues"]
  end

  def test_insert_method_works_with_supplies_passed_in
    wt = WagonTrain.new

    wt.append("Burke", {"pounds of food" => 200})
    wt.list.prepend("Hardy", {"spare wagon tongues" => 3})
    wt.list.insert(1, "West", {"pounds of food" => 300})

    assert_equal "West", wt.list.head.next_node.surname
    assert_equal 3, wt.count
  end

  def test_wagontrain_lists_all_supplies_as_a_hash_with_values_summed
    wt = WagonTrain.new

    wt.append("Burke", {"pounds of food" => 200})
    wt.list.prepend("Hardy", {"spare wagon tongues" => 3})
    wt.list.insert(1, "West", {"pounds of food" => 300})

    assert_equal 500, wt.supplies["pounds of food"]
    assert_equal 3, wt.supplies["spare wagon tongues"]
  end



end
