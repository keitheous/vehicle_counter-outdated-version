require 'pry'
require_relative 'data_reader_2'

class DataAnalyse

  attr_accessor :bounds, :frequency_day

  def initialize
    @nb = DataReader.new.sort_north_lines
    @sb = DataReader.new.sort_south_lines
  end

  def nb_sort_frequency
    nb_hourly = hourly(@nb)
    puts nb_hourly.count

    # nb_am_vs_pm = compare_am_to_pm(nb_hourly)
  end

  def sb_sort_frequency
    sb_hourly = hourly(@sb)
    # puts sb_hourly
    # sb_am_vs_pm = compare_am_to_pm(sb_hourly)
  end

  private

  def compare_am_to_pm(subject)

    (1..5).each do |day|
      morning_count = 0
      evening_count = 0

      (6..11).each do |morning_hour|
        morning_count += subject["Day #{day}"][morning_hour].to_i
      end

      (18..23).each do |evening_hour|
        evening_count += subject["Day #{day}"][evening_hour].to_i
      end

      puts "Day #{day}, morning to evening = #{morning_count} to #{evening_count}"

    end

  end

  def hourly(subject)
    frequency_day = {}
    (1..5).each do |day|

      daily_frequency = []
      # puts "Sorting Hourly Day #{day}"
      day_subject= subject.select{|key, hash| hash["Day"] == day }

      ("00"..."24").each do |hour|
        stored_by_hour = day_subject.select{|key, hash| hash["1st UTC"][0] == "#{hour[0]}" && hash["1st UTC"][1] == "#{hour[1]}"}

        daily_frequency.push("#{stored_by_hour.count}")
        # binding.pry
      end
      

      frequency_day["Day #{day}"] = daily_frequency

    end

    frequency_day
  end

end
DataAnalyse.new.nb_sort_frequency
