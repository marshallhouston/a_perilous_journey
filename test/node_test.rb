require 'minitest/autorun'
require 'minitest/pride'
require './lib/node'

class NodeTest < Minitest::Test

  def test_node_exists
    node = Node.new("Houston", {"pounds of food" => 200})
    assert_instance_of Node, node
  end

  def test_node_has_a_surname
    node = Node.new("Burke", {"pounds of food" => 200})
    assert_equal "Burke", node.surname
  end

  def test_next_node_exists
    node = Node.new("Longmuir", {"pounds of food" => 200})
    assert_nil @next_node
  end
end
