require 'pry'

class DataReader
  attr_accessor :north_bound, :south_bound, :dataset, :temporary_variable, :file

  def initialize (dataset = "../fake_data.txt")
    @file = File.readlines(dataset)
    @north_bound = {}
    @south_bound = {}
    @temporary_B_variable = []

  end

  def sort_lines
    vehicle_NB_count = 1
    vehicle_SB_count = 1
    number_of_lines = @file.size

    (0...number_of_lines).each do |index|
      if (index % 2 == 0)

        if @file[index][0] == @file[index+1][0]
          @north_bound["Vehicle #{vehicle_NB_count}"] = {
            "1st" => @file[index],
            "2nd" => @file[index+1]
          }
          vehicle_NB_count +=1
        end
      end

      if @file[index][0] == "B"
        @temporary_B_variable.push(@file[index])
      end

    end

    @temporary_B_variable.each_with_index do |line, index|
      if (index % 2 == 0)
        @south_bound["Vehicle #{vehicle_SB_count}"] = {
          "1st" => line,
          "2nd" => @temporary_B_variable[index+1]
        }
        vehicle_SB_count += 1
      end
    end
    @north_bound
    # binding.pry

  end
end
# DataReader.new.sort_lines
