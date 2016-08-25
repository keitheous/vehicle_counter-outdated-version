require 'pry'
gem 'minitest', '>= 5.0.0'
require 'minitest/autorun'
#is this necessary?
# require_relative '../lib/data_reader_2'
require_relative '../lib/data_analyse_2'
require "minitest/pride"

class DataAnalyseTest < Minitest::Test
  def setup
    @begin = DataAnalyse.new
  end
  #nb is successfully populated from data reader
  def test_that_nb_is_not_nil
    assert_equal true, @begin.nb != nil
  end

  #sb is successfully populated from data reader
  def test_that_sb_is_not_nil
    assert_equal true, @begin.sb != nil
  end

  #nb weekdays are populated
  def test_the_weekdays_population_complete
    boolean = (@begin.nb_monday.length > 0 )&&(@begin.sb_monday.length > 0 )&&(@begin.nb_tuesday.length > 0 )&&(@begin.sb_tuesday.length > 0 )&&(@begin.nb_wednesday.length > 0 )&&(@begin.sb_wednesday.length > 0 )&&(@begin.nb_thursday.length > 0 )&&(@begin.sb_thursday.length > 0 )&&(@begin.nb_friday.length > 0 )&&(@begin.sb_friday.length > 0)
    assert_equal true, boolean
  end


end
