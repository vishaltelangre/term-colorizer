module Term
  module Colorizer
    TERM_COLORS = %w{
                      black red green yellow blue magenta cyan white bright_black
                      bright_red bright_green bright_yellow bright_blue bright_magenta
                      bright_cyan bright_white
                    }

    def method_missing(sym, *args, &block)
      method = sym.to_s
      super unless TERM_COLORS.include? method
      self.send(method)
    end

    TERM_COLORS.each do |color|
      case color
      when "black" then define_method("black") { "\e[30m" + self.to_s + "\e[0m" }
      when "red" then define_method("red") { "\e[31m" + self.to_s + "\e[0m" }
      when "green" then define_method("green") { "\e[32m" + self.to_s + "\e[0m" }
      when "yellow" then define_method("yellow") { "\e[33m" + self.to_s + "\e[0m" }
      when "blue" then define_method("blue") { "\e[34m" + self.to_s + "\e[0m" }
      when "magenta" then define_method("magenta") { "\e[35m" + self.to_s + "\e[0m" }
      when "cyan" then define_method("cyan") { "\e[36m" + self.to_s + "\e[0m" }
      when "white" then define_method("white") { "\e[37m" + self.to_s + "\e[0m" }
      when "bright_black" then define_method("bright_black") { "\e[1m\e[30m" + self.to_s + "\e[0m" }
      when "bright_red" then define_method("bright_red") { "\e[1m\e[31m" + self.to_s + "\e[0m" }
      when "bright_green" then define_method("bright_green") { "\e[1m\e[32m" + self.to_s + "\e[0m" }
      when "bright_yellow" then define_method("bright_yellow") { "\e[1m\e[33m" + self.to_s + "\e[0m" }
      when "bright_blue" then define_method("bright_blue") { "\e[1m\e[34m" + self.to_s + "\e[0m" }
      when "bright_magenta" then define_method("bright_magenta") { "\e[1m\e[35m" + self.to_s + "\e[0m" }
      when "bright_cyan" then define_method("bright_cyan") { "\e[1m\e[36m" + self.to_s + "\e[0m" }
      when "bright_white" then define_method("bright_white") { "\e[1m\e[37m" + self.to_s + "\e[0m" }
      end
    end
  end
end

class String
  include Term::Colorizer
end
