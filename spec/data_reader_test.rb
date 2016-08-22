require 'pry'
gem 'minitest', '>= 5.0.0'
require 'minitest/autorun'
require_relative '../lib/data_reader'
require "minitest/pride"

class DataReaderTest < Minitest::Test
  #initialize @north_bound as an hash
  def setup
    @entry = DataReader.new
    @processed = DataReader.new.sort_lines
  end

  def test_whats_north_bound_declared_as?
    assert_equal Hash.new, @entry.north_bound
  end

  #initialize @south_bound as an hash
  def test_whats_south_bound_declared_as?
    assert_equal Hash.new, @entry.south_bound
  end

  #successfully reads dataset - locatable
  def test_location_of_dataset
    assert_equal true , @entry.file.size > 0
  end

  def test_after_sort_methid_NB_hash_is_populated
    assert_equal true, @processed.north_bound.size > 0
  end

  def test_after_sort_methid_SB_hash_is_populated
    assert_equal true, @processed.south_bound.size > 0
  end

end
