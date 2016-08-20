require 'pry'

class DataReader
  attr_accessor :north_bound, :south_bound

  def initialize
    @north_bound = {}
    @south_bound = {}
  end

  def self.source(dataset = "../fake_data.txt")
    File.size(dataset)

    # binding.pry
  end
end

# DataReader.source
