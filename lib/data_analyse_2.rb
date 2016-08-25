require 'pry'
require_relative 'data_reader_2'

class DataAnalyse

  attr_accessor :bounds, :frequency_day

  def initialize
    @nb = DataReader.new.sort_north_lines
    @sb = DataReader.new.sort_south_lines
  end

  def nb_sort_frequency
    # nb_hourly = hourly(@nb)
    # puts nb_hourly
  end

  def sb_sort_frequency
    # sb_hourly = hourly(@sb)
    # puts sb_hourly
  end

  private

  def hourly(subject)
    frequency_day = {}

    (1..5).each do |day|

      daily_frequency = []
      puts "Sorting Hourly Day #{day}"
      day_subject= subject.select{|key, hash| hash["Day"] == day }

      ("00"..."24").each do |hour|
        stored_by_hour = day_subject.select{|key, hash| hash["1st UTC"][0] == "#{hour[0]}" && hash["1st UTC"][1] == "#{hour[1]}"}

        time = (hour.to_i + 11) % 12 + 1
        hour.to_i < 12 ? meridiem = "am" : meridiem = "pm"

        daily_frequency.push("#{stored_by_hour.count}")
      end

      frequency_day["Day #{day}"] = daily_frequency
      
    end

    frequency_day
  end

end
DataAnalyse.new.nb_sort_frequency
