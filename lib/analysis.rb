require 'pry'
require_relative 'data_reader_2'

class Analyse
  attr_accessor :nb, :sb, :nb_monday, :nb_tuesday, :nb_wednesday, :nb_thursday, :nb_friday, :sb_monday, :sb_tuesday, :sb_wednesday, :sb_thursday, :sb_friday

  def initialize
    @nb = DataReader.new.sort_north_lines
    @sb = DataReader.new.sort_south_lines
    @nb_monday = nb.select{|key, hash| hash["Day"] == 1 }
    @nb_tuesday = nb.select{|key, hash| hash["Day"] == 2 }
    @nb_wednesday = nb.select{|key, hash| hash["Day"] == 3 }
    @nb_thursday = nb.select{|key, hash| hash["Day"] == 4 }
    @nb_friday = nb.select{|key, hash| hash["Day"] == 5 }
    @sb_monday = sb.select{|key, hash| hash["Day"] == 1 }
    @sb_tuesday = sb.select{|key, hash| hash["Day"] == 2 }
    @sb_wednesday = sb.select{|key, hash| hash["Day"] == 3 }
    @sb_thursday = sb.select{|key, hash| hash["Day"] == 4 }
    @sb_friday = sb.select{|key, hash| hash["Day"] == 5 }
    #aww.. this isnt very dry =(
  end

end
