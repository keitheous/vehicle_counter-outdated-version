require 'pry'

class DataReader
  attr_accessor :north_bound, :south_bound, :dataset, :temporary_variable

  def initialize (dataset = "../fake_data.txt")
    @north_bound = {}
    @south_bound = {}
    @temporary_variable = ""
    @dataset = dataset
  end

  def obtain_data
    @temporary_variable = IO.readlines(@dataset)[0]
    # binding.pry
  end
end
# DataReader.new.obtain_data
