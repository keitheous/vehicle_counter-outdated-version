require 'pry'

class DataReader
  attr_accessor :north_bound, :south_bound, :dataset, :file, :vehicle_per_day

  def initialize (dataset = "../real_sample_data.txt")
    @file = File.readlines(dataset)
    @north_bound = {}
    @south_bound = {}
    @vehicle_per_day = 1
  end

  def sort_north_lines
    vehicle_NB_count = 1
    number_of_lines = @file.size
    north_day = 0
    t_range = 0

    (0...number_of_lines).each do |index|
      if (index % 2 == 0)
        if @file[index].length < @file[index-1].length
          north_day += 1
          @vehicle_per_day = 1
          # puts "North Bound Day Number #{north_day} : Index #{index}"
        end

        if @file[index][0] == @file[index+1][0]
          t1 = @file[index].delete('^0-9').strip.to_i / 1000.000
          t1_converted = Time.at(t1).utc.strftime("%H:%M:%S")
          t2 = @file[index+1].delete('^0-9').strip.to_i / 1000.000
          t2_converted = Time.at(t2).utc.strftime("%H:%M:%S")
          t_range = (t2-t1).round(4)
          minutes = t2_converted[3]+t2_converted[4]
          quart , third = groupie(minutes)

          @north_bound["Vehicle #{vehicle_NB_count}"] = {
            "1st" => t1,
            "1st UTC" => t1_converted,
            "2nd" => t2,
            "2nd UTC" => t2_converted,
            "Range" => t_range,
            "Day" => north_day,
            "Veh/Day" => @vehicle_per_day,
            "quarter group" => quart,
            "third group" => third
          }

          vehicle_NB_count +=1
          @vehicle_per_day += 1
        end
      end
    end
    @north_bound
    # binding.pry
  end


  def sort_south_lines
    temporary_B_variable = []
    vehicle_SB_count = 1
    south_day = 0
    t_range = 0

    @file.each do |line|
      if line[0] == "B"
        temporary_B_variable.push(line)
      end
    end

    temporary_B_variable.each_with_index do |line, index|
      if line.length < temporary_B_variable[index-1].length
        south_day += 1
        @vehicle_per_day = 1
        # puts "South Bound Day number #{south_day} : Index #{index}"
      end

      if (index % 2 == 0)
        t1 = line.delete('^0-9').strip.to_i / 1000.000
        t1_converted = Time.at(t1).utc.strftime("%H:%M:%S")
        t2 = temporary_B_variable[index+1].delete('^0-9').strip.to_i / 1000.000
        t2_converted = Time.at(t2).utc.strftime("%H:%M:%S")
        t_range = (t2-t1).round(4)
        minutes = t2_converted[3]+t2_converted[4]
        quart , third = groupie(minutes)

        @south_bound["Vehicle #{vehicle_SB_count}"] = {
          "1st" => t1,
          "1st UTC" => t1_converted,
          "2nd" => t2,
          "2nd UTC" => t2_converted,
          "Range" => t_range,
          "Day" => south_day,
          "Veh/Day" => @vehicle_per_day,
          "quarter group" => quart,
          "third group" => third
        }
        vehicle_SB_count += 1
        @vehicle_per_day += 1

      end
    end
    @south_bound
    # binding.pry
  end

  private

  def groupie(minute)
    case minute
    when "00".."14" then quart = "1st_quart"
    when "15".."29" then quart = "2nd_quart"
    when "30".."44" then quart = "3rd_quart"
    when "45".."59" then quart = "4th_quart"
    end
    case minute
    when "00".."19" then third = "1st_third"
    when "20".."39" then third = "2nd_third"
    when "40".."59" then third = "3rd_third"
    end

    return quart, third
  end

end

# DataReader.new.sort_north_lines
#
# @south_bound["Vehicle 36"]["1st"][0..1]
# @south_bound.select{|key, hash| hash["Day"] == 1 }
# nb_m.select{|key, hash| hash["1st UTC"][0] == "0" && hash["1st UTC"][1] == "6" }

# [7] pry(main)> ("05".."15").each do |index|
# [7] pry(main)*   puts index[0]
# [7] pry(main)*   puts index[1]
# [7] pry(main)* end
