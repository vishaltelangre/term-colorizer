require 'spec_helper'

describe Term::Colorizer do
  it "should return a equivalent ANSI formatted string with for red color" do
    "Duck can quack".red.should eq "\e[31mDuck can quack\e[0m"
  end

  it "should have `color_methods` method available on String instance" do
    "Hello world!".should respond_to(:color_methods)
  end

  it "should respond to an available color method, e.g. \"Hello world!\".respond_to?(:bright_green)" do
    "Hello world!".should respond_to(:bright_green)
  end

end
