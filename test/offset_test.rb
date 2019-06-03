require 'simplecov'
SimpleCov.start
require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require 'mocha/minitest'
require './lib/keygen'
require './lib/offset'

class OffsetTest < Minitest::Test

  def setup
    @offset = Offset.new
    @keygen = KeyGen.new
  end

  def test_it_exists
    assert_instance_of Offset, @offset
  end

  def test_date_generated
    Offset.any_instance.stubs(:date).returns("020619")
    assert_equal "020619", @offset.date
  end

  def test_offset_geneated_from_date
    assert_equal ["3", "1", "6", "1"], @offset.generate_offset("010619")
  end

  def test_size_of_final_shift
    keys = ["74", "43", "35", "59"]
    offsets= ["3", "1", "6", "1"]

    assert_equal [77, 44, 41, 60], @offset.generate_shift(keys, offsets)
  end

end
