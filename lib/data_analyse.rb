require 'pry'
require_relative 'data_reader_2'

class DataAnalyse
  # attr_accessor :nb_monday, :nb_tuesday, :nb_wednesday, :nb_thursday, :nb_friday, :sb_monday, :sb_tuesday, :sb_wednesday, :sb_thursday, :sb_friday
  attr_accessor :subject

  def initialize(day = 2, bound = "nb")
      if bound == "nb"
        nb = DataReader.new.sort_north_lines
        @subject = nb.select{|key, hash| hash["Day"] == day }
      elsif bound == "sb"
        sb = DataReader.new.sort_south_lines
        @subject = sb.select{|key, hash| hash["Day"] == day }
      end
  end
  # def initialize
  #   nb = DataReader.new.sort_north_lines
  #   sb = DataReader.new.sort_south_lines
  #   @nb_monday = nb.select{|key, hash| hash["Day"] == 1 }
  #   @nb_tuesday = nb.select{|key, hash| hash["Day"] == 2 }
  #   @nb_wednesday = nb.select{|key, hash| hash["Day"] == 3 }
  #   @nb_thursday = nb.select{|key, hash| hash["Day"] == 4 }
  #   @nb_friday = nb.select{|key, hash| hash["Day"] == 5 }
  #   @sb_monday = sb.select{|key, hash| hash["Day"] == 1 }
  #   @sb_tuesday = sb.select{|key, hash| hash["Day"] == 2 }
  #   @sb_wednesday = sb.select{|key, hash| hash["Day"] == 3 }
  #   @sb_thursday = sb.select{|key, hash| hash["Day"] == 4 }
  #   @sb_friday = sb.select{|key, hash| hash["Day"] == 5 }
    #aww.. this isnt very dry =(
    # binding.pry
  # end

  def sort_hourly
    stored_hourly = {}
    hourly_frequency = {}
    # puts "hourly breakdown:"
    ("00"..."24").each do |index|
      time = (index.to_i + 11) % 12 + 1
      index.to_i < 12 ? meridiem = "am" : meridiem = "pm"

      stored_hourly["#{time}#{meridiem}"] = @subject.select{
        |key, hash| hash["1st UTC"][0] == "#{index[0]}" && hash["1st UTC"][1] == "#{index[1]}"
        }

      hourly_frequency["#{time}#{meridiem}"]= stored_hourly["#{time}#{meridiem}"].count
      # puts "From #{time}#{meridiem} = #{stored_hourly[index]} vehicles"
    end

    binding.pry
  end

end
DataAnalyse.new(5,"sb").sort_hourly
