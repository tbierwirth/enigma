require 'simplecov'
SimpleCov.start
require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/offset'

class OffsetTest < Minitest::Test

  def setup
    @offset = Offset.new
  end

  def test_it_exists
    assert_instance_of Offset, @offset
  end

  def test_date_generated
    assert_equal "010619", @offset.date
  end

  def test_offset_geneated_from_date
    assert_equal "3161", @offset.generate_offset
  end

end
