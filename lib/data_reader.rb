require 'pry'

class DataReader
  attr_accessor :north_bound, :south_bound, :dataset, :temporary_variable, :file

  def initialize (dataset = "../real_sample_data.txt")
    @file = File.readlines(dataset)
    @north_bound = {}
    @south_bound = {}
    @temporary_B_variable = []

  end

  def sort_lines
    vehicle_NB_count = 1
    vehicle_SB_count = 1
    number_of_lines = @file.size
    north_day = 0
    south_day = 0
    vehicle_per_day = 1

    (0...number_of_lines).each do |index|
      if (index % 2 == 0)
        if @file[index].length < @file[index-1].length
          north_day += 1
          vehicle_per_day = 1
          puts "North Bound Day Number #{north_day} : Index #{index}"
        end

        if @file[index][0] == @file[index+1][0]
          t1 = @file[index].delete('^0-9').strip.to_i / 1000.000
          t1 = Time.at(t1).utc.strftime("%H:%M:%S")
          t2 = @file[index+1].delete('^0-9').strip.to_i / 1000.000
          t2 = Time.at(t2).utc.strftime("%H:%M:%S")
          @north_bound["Vehicle #{vehicle_NB_count}"] = {
            "1st" => t1,
            "2nd" => t2,
            "Day" => north_day,
            "Veh/Day" => vehicle_per_day
          }

          vehicle_NB_count +=1
          vehicle_per_day += 1
        end

      end

      if @file[index][0] == "B"
        @temporary_B_variable.push(@file[index])
      end

    end

    @temporary_B_variable.each_with_index do |line, index|
      if line.length < @temporary_B_variable[index-1].length
        south_day += 1
        vehicle_per_day = 1
        puts "South Bound Day number #{south_day} : Index #{index}"
      end
      if (index % 2 == 0)
        t1 = line.delete('^0-9').strip.to_i / 1000.000
        t1 = Time.at(t1).utc.strftime("%H:%M:%S")
        t2 = @temporary_B_variable[index+1].delete('^0-9').strip.to_i / 1000.000
        t2 = Time.at(t2).utc.strftime("%H:%M:%S")

        @south_bound["Vehicle #{vehicle_SB_count}"] = {
          "1st" => t1,
          "2nd" => t2,
          "Day" => south_day,
          "Veh/Day" => vehicle_per_day
        }
        vehicle_SB_count += 1
        vehicle_per_day += 1
      end


    end
    # binding.pry

  end
end
# DataReader.new.sort_lines
#
# @south_bound["Vehicle 36"]["1st"][0..1]
# @south_bound.select{|key, hash| hash["Day"] == 1 }
