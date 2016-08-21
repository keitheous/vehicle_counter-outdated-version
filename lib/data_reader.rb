require 'pry'

class DataReader
  attr_accessor :north_bound, :south_bound, :dataset, :temporary_variable

  def initialize (dataset = "../fake_data.txt")
    @north_bound = {}
    @south_bound = {}
    @temporary_variable = []
    @dataset = dataset
  end

  def read_lines
    number_of_lines = File.open(@dataset,"r").to_a.count
    day = 1
    north_vehicle = 1
    south_vehicle = 1
    line_1 = ""
    line_2 = ""

    (0...number_of_lines).each do |index|
      if (index % 2 == 0)
        line_1 = /.\d+/.match(IO.readlines(@dataset)[index])
        line_2 = /.\d+/.match(IO.readlines(@dataset)[index+1])
        line_3 = /.\d+/.match(IO.readlines(@dataset)[index+3])
        @temporary_variable[0] = line_1.to_s
        @temporary_variable[1] = line_2.to_s

        if @temporary_variable[0][0] == @temporary_variable[1][0]
          # puts "North_Bound!!"
          @north_bound["vehicle no. #{north_vehicle}"] = {
            "1st axle" => @temporary_variable[0],
            "2nd axle" => @temporary_variable[1]
          }
          north_vehicle += 1
        # elsif @temporary_variable[1][0] == "B"

        end

      end

      @north_bound
    end

    # binding.pry
  end
end
# DataReader.new.read_lines
