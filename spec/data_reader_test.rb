require 'pry'
gem 'minitest', '>= 5.0.0'
require 'minitest/autorun'
require_relative '../lib/data_reader'
require 'minitest/pride'

describe "DataReader" do

  before do
    @entry = DataReader.new
  end
  #create an initialize function under DataReaderClass
  it "entry must not equal to nil" do
    @entry.wont_be_nil
  end

  #define north_bound as an empty Hash
  it "north bound defined as empty hash" do
    @entry.north_bound.must_equal Hash.new
  end

  #define south_bound as an empty Hash
  it "south bound defined as empty hash" do
    @entry.south_bound.must_equal Hash.new
  end

  #successfully reads .txt file using F.size
  it "size of dataset should not equal to zero" do
    DataReader.source.wont_be_nil
  end

end
