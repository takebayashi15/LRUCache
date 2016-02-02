# LRUCahce.rubyのUnit Test
#
require 'minitest/autorun'
require './lru.rb'

MiniTest.autorun

class TestLRU < MiniTest::Test
  def setup
    @lru = LRUCache.new 3
  end
  def teardown
    @lru = nil
  end

  def test_one
    # 一度も参照しない場合は、最も古いものから消える
    @lru.put("keyA", "valueA")
    @lru.put("keyB", "valueB")
    @lru.put("keyC", "valueC")
    @lru.put("keyD", "valueD")
    assert_equal(nil, @lru.get("keyA"))
  end

  def test_two
    # 参照があった場合、優先順位が入れ替わる
    @lru.put("keyA", "valueA")
    @lru.put("keyB", "valueB")
    @lru.put("keyC", "valueC")
    assert_equal("valueA", @lru.get("keyA"))
    @lru.put("keyD", "valueD")
    assert_equal("valueA", @lru.get("keyA"))
  end
end
