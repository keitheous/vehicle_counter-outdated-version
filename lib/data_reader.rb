require 'pry'

class DataReader
  def dataset(data = "../fake_data.txt")
    File.open(data, "r")
  end
end
