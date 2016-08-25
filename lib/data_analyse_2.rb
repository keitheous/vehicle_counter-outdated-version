require 'pry'
require_relative 'data_reader_2'

class DataAnalyse
  # attr_accessor :nb_monday, :nb_tuesday, :nb_wednesday, :nb_thursday, :nb_friday, :sb_monday, :sb_tuesday, :sb_wednesday, :sb_thursday, :sb_friday
  attr_accessor :bounds, :frequency_day

  def initialize
    @nb = DataReader.new.sort_north_lines
    @sb = DataReader.new.sort_south_lines
    # @bounds = [nb,sb]
  end

  def nb_sort_frequency
    quarterly
  end

  def sb_sort_frequency
  end

  # private


  def quarterly(subject)
    frequency_day = {}

    (1..5).each do |day|

      daily_frequency = []
      puts "DAY #{day}"
      day_subject= @nb.select{|key, hash| hash["Day"] == day }

      ("00"..."24").each do |hour|
        stored_by_hour = {}
        stored_by_hour = day_subject.select{|key, hash| hash["1st UTC"][0] == "#{hour[0]}" && hash["1st UTC"][1] == "#{hour[1]}"}
        time = (hour.to_i + 11) % 12 + 1
        hour.to_i < 12 ? meridiem = "am" : meridiem = "pm"

        daily_frequency.push("#{stored_by_hour.count}")
      end
      frequency_day["#{day}"] = daily_frequency
    end
    binding.pry
    # (1..5).each do |day|
    #   puts "day #{day}"
    #   frequency_day[day] = Array.new
    #   # "by_hour_day_#{day}" = Hash.new
    #   ("00".."24").each do |index|
    #     # time = (index.to_i + 11) % 12 + 1
    #     # index.to_i < 12 ? meridiem = "am" : meridiem = "pm"
    #
    #     by_hour[index] = nb_day_1.select{|key, hash| hash["1st UTC"][0] == "#{index[0]}" && hash["1st UTC"][1] == "#{index[1]}"}
    #
    #     frequency_day[day].push(by_hour[index])
    #   end
    # end



  end


end
DataAnalyse.new.quarterly(nb)
