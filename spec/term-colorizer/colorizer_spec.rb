require 'spec_helper'

describe Term::Colorizer do
  string = "It's a very simple sentence!"

  context "Testing methods' availability..." do
    it "check color methods" do
      methods = [:black, :red, :green, :yellow, :blue, :magenta, :cyan, :white]
      methods.map do |method|
        expect(string.color_methods).to include(method)
      end
    end

    it "check bright_color_methods" do
      methods = [:bright_black, :bright_red, :bright_green, :bright_yellow, :bright_blue, :bright_magenta, :bright_cyan, :bright_white]
      methods.map do |method|
        expect(string.bright_color_methods).to include(method)
      end
    end

    it "check bg_color_methods" do
      methods = [:bg_black, :bg_red, :bg_green, :bg_yellow, :bg_blue, :bg_magenta, :bg_cyan, :bg_white]
      methods.map do |method|
        expect(string.bg_color_methods).to include(method)
      end
    end

    it "check all public methods availed by term colorizer gem" do
      methods = [:black, :red, :green, :yellow, :blue, :magenta, :cyan, :white, :bright_black, :bright_red, :bright_green, :bright_yellow, :bright_blue, :bright_magenta, :bright_cyan, :bright_white, :bg_black, :bg_red, :bg_green, :bg_yellow, :bg_blue, :bg_magenta, :bg_cyan, :bg_white, :underline, :strikethrough, :term_colorizer_methods, :fancy_color_methods, :no_underline, :no_strikethrough, :no_color, :no_bg_color, :plain_text, :reset_fancyness]
      methods.map do |method|
        expect(string.term_colorizer_methods).to include(method)
        string.should respond_to(method)
      end
    end

    it "`term_colorizer_methods` should display combined output of `color_methods`+`bright_color_methods`+`bg_color_methods`" do
      expected_methods = string.color_methods + string.bright_color_methods + string.bg_color_methods
      expected_methods.map do |method|
        expect(string.term_colorizer_methods).to include(method)
      end
    end

    it "check whether `fancy_color_methods` is an alias method of `term_colorizer_methods`" do
      string.fancy_color_methods.should == string.term_colorizer_methods
    end
  end

  context "Testing color & background color methods..." do
    context "Testing normal color methods..." do
      it "check all normal color methods' responses" do
        string.black.should eq("\e[30mIt's a very simple sentence!\e[0m")
        string.red.should eq("\e[31mIt's a very simple sentence!\e[0m")
        string.green.should eq("\e[32mIt's a very simple sentence!\e[0m")
        string.yellow.should eq("\e[33mIt's a very simple sentence!\e[0m")
        string.blue.should eq("\e[34mIt's a very simple sentence!\e[0m")
        string.magenta.should eq("\e[35mIt's a very simple sentence!\e[0m")
        string.cyan.should eq("\e[36mIt's a very simple sentence!\e[0m")
        string.white.should eq("\e[37mIt's a very simple sentence!\e[0m")
      end

      it "check resultant string when chained normal color methods applied on same string" do
        string.red.should eq "\e[31mIt's a very simple sentence!\e[0m"
        string.red.cyan.should eq "\e[36mIt's a very simple sentence!\e[0m"
        string.red.cyan.green.white.black.black.yellow.should eq "\e[33mIt's a very simple sentence!\e[0m"
      end
    end

    context "Testing bright color methods..." do
      it "check all bright color methods' responses" do
        string.bright_black.should eq("\e[1m\e[30mIt's a very simple sentence!\e[0m")
        string.bright_red.should eq("\e[1m\e[31mIt's a very simple sentence!\e[0m")
        string.bright_green.should eq("\e[1m\e[32mIt's a very simple sentence!\e[0m")
        string.bright_yellow.should eq("\e[1m\e[33mIt's a very simple sentence!\e[0m")
        string.bright_blue.should eq("\e[1m\e[34mIt's a very simple sentence!\e[0m")
        string.bright_magenta.should eq("\e[1m\e[35mIt's a very simple sentence!\e[0m")
        string.bright_cyan.should eq("\e[1m\e[36mIt's a very simple sentence!\e[0m")
        string.bright_white.should eq("\e[1m\e[37mIt's a very simple sentence!\e[0m")
      end

      it "check resultant string when chained color methods applied on same string" do
        string.bright_red.should eq "\e[1m\e[31mIt's a very simple sentence!\e[0m"
        string.bright_red.bright_cyan.should eq "\e[1m\e[36mIt's a very simple sentence!\e[0m"
        string.bright_red.bright_cyan.bright_green.bright_white.bright_black.bright_black.bright_yellow.should eq "\e[1m\e[33mIt's a very simple sentence!\e[0m"
      end
    end

    context "Testing background color methods..." do
      it "check all background color methods' responses" do
        string.bg_black.should eq("\e[40mIt's a very simple sentence!\e[0m")
        string.bg_red.should eq("\e[41mIt's a very simple sentence!\e[0m")
        string.bg_green.should eq("\e[42mIt's a very simple sentence!\e[0m")
        string.bg_yellow.should eq("\e[43mIt's a very simple sentence!\e[0m")
        string.bg_blue.should eq("\e[44mIt's a very simple sentence!\e[0m")
        string.bg_magenta.should eq("\e[45mIt's a very simple sentence!\e[0m")
        string.bg_cyan.should eq("\e[46mIt's a very simple sentence!\e[0m")
        string.bg_white.should eq("\e[47mIt's a very simple sentence!\e[0m")
      end

      it "check resultant string when chained background methods applied on same string" do
        string.bg_red.should eq "\e[41mIt's a very simple sentence!\e[0m"
        string.bg_red.bg_cyan.should eq "\e[46mIt's a very simple sentence!\e[0m"
        string.bg_red.bg_cyan.bg_green.bg_white.bg_black.bg_black.bg_yellow.should eq "\e[43mIt's a very simple sentence!\e[0m"
      end
    end

    context "Testing reset methods for color & background..." do
      it "check `no_color` and `no_bg_color` methods' behaviours" do
        string.magenta.should respond_to(:no_color)
        string.should respond_to(:no_bg_color)
        string.magenta.no_color.should eq(string)
        string.magenta.no_color.no_bg_color.should eq(string)
        string.bright_magenta.bg_green.red.no_bg_color.no_color.no_color.should eq(string)
        string.bg_yellow.bright_white.no_color.should eq(string.bg_yellow)
        string.bg_black.magenta.bright_black.red.red.red.white.no_bg_color.bright_cyan.no_color.should eq(string)
      end
    end
  end

  context "Testing bonus methods..." do
    it "check `underline` method's behaviour" do
      string.red.underline.underline.green.should eq("\e[32m\e[4m\e[4mIt's a very simple sentence!\e[0m")
      string.sub(/(simple)/, '\1'.red.underline.underline.green.yellow).should eq("It's a very \e[33m\e[4m\e[4msimple\e[0m sentence!")
    end

    it "check `strikethrough` method's behaviour" do
      string.red.strikethrough.green.strikethrough.should eq("\e[9m\e[32m\e[9mIt's a very simple sentence!\e[0m")
      string.sub(/(simple)/, '\1'.red.strikethrough.green.yellow).should eq("It's a very \e[33m\e[9msimple\e[0m sentence!")
    end

    it "check `no_underline` and `no_strikethrough` methods' behaviours" do
      string.sub(/(simple)/, '\1'.red.bg_yellow.green.yellow.red.underline.no_underline.strikethrough).should eq("It's a very \e[9m\e[31m\e[43msimple\e[0m sentence!")
      string.sub(/(simple)/, '\1'.red.strikethrough.green.yellow.strikethrough.strikethrough.no_strikethrough.no_color).should eq(string)
    end
  end

  context "Final Tests..." do
    it "check resultant string when applied many color, background, bonus methods on different sections of string and also called reset methods on it" do
      string.sub(/(simple)/, '\1'.red.bg_yellow.green.yellow.red.underline.no_underline.strikethrough.no_bg_color).should eq("It's a very \e[9m\e[31msimple\e[0m sentence!")
      string.sub(/(simple)/, '\1'.red.bg_yellow.green.yellow.red.underline.no_underline.strikethrough.no_bg_color.no_color.no_strikethrough).should eq(string)
      complex_string = string.yellow + " It has nothing to do with my ".green + "name,".underline + " but FYI, my name is".bg_magenta.black + " " + "foo".strikethrough.red + " Vishal!".upcase.bright_cyan
      complex_string.should eq("\e[33mIt's a very simple sentence!\e[0m\e[32m It has nothing to do with my \e[0m\e[4mname,\e[0m\e[30m\e[45m but FYI, my name is\e[0m \e[31m\e[9mfoo\e[0m\e[1m\e[36m VISHAL!\e[0m")
      complex_string.plain_text.should == "It's a very simple sentence! It has nothing to do with my name, but FYI, my name is foo VISHAL!"
      complex_string.reset_fancyness.should == complex_string.plain_text
    end
  end
end