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

    wt.append("Burke")

    assert_equal "Burke", wt.list.head.surname
  end
end
