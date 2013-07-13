require 'spec_helper'

describe Term::Colorizer do
  it "should return a equivalent ANSI formatted string with for red color" do
    "Duck can quack".red.should eq "\e[31mDuck can quack\e[0m"
  end
end
