require 'pry'
gem 'minitest', '>= 5.0.0'
require 'minitest/autorun'
require_relative '../lib/data_reader_2'
require "minitest/pride"

class DataReaderTest < Minitest::Test

  def setup
    @entry = DataReader.new
  end
  ##initialize @north_bound as an hash
  def test_whats_north_bound_declared_as?
    assert_equal Hash.new, @entry.north_bound
  end

  #initialize @south_bound as an hash
  def test_whats_south_bound_declared_as?
    assert_equal Hash.new, @entry.south_bound
  end

  #successfully reads dataset - locatable
  def test_location_of_dataset_exist
    assert_equal true , @entry.file.size > 0
  end

  #nb hash must be populated after the sort_north_lines method
  def test_for_nb_hash_after_sort
    assert_equal true, @entry.sort_north_lines.size > 0
  end

  #sb hash must be populated after the sort_south_lines method
  def test_for_sb_hash_after_sort
    assert_equal true, @entry.sort_south_lines.size > 0
  end

  #check that range is indeed t2 - t1 for nb
  def test_for_time_range_validity_nb
    nb = @entry.sort_north_lines
    t1 = nb["Vehicle 2"]["2nd"]
    t2 = nb["Vehicle 2"]["1st"]
    time_range = nb["Vehicle 2"]["Range"]
    assert_equal true, (t2-t1).abs.round(4) == time_range
  end

  #check that t1&t2's range < 2 second for nb
  def test_for_time_range_validity_nb
    nb = @entry.sort_north_lines
    t1 = nb["Vehicle 2"]["2nd"]
    t2 = nb["Vehicle 2"]["1st"]
    assert_equal true, (t2-t1).abs.round(1) < 2
  end

  #check that range is indeed t2 - t1 for sb
  def test_for_time_range_validity_sb
    sb = @entry.sort_south_lines
    t1 = (sb["Vehicle 2"]["2nd"])
    t2 = (sb["Vehicle 2"]["1st"])
    time_range = sb["Vehicle 2"]["Range"]
    assert_equal true, (t2-t1).abs.round(4) == time_range
  end

  def test_for_time_range_validity_sb
    sb = @entry.sort_south_lines
    t1 = sb["Vehicle 24"]["2nd"]
    t2 = sb["Vehicle 24"]["1st"]
    assert_equal true, (t2-t1).abs.round(1) < 2
  end

  # how to i loop through the hash and check for each statement?
  # how do i check that each Element preceeds with A or B - loop through each Hash

end
