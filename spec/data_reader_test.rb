require 'pry'
gem 'minitest', '>= 5.0.0'
require 'minitest/autorun'
require_relative '../lib/data_reader'
require 'minitest/pride'

class DataReaderTest < Minitest::Test
    def setup
      @entry = DataReader.new
    end

    def test_for_existance_of_data
      assert_equal true , @entry.dataset != 0
    end
end
