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
      self.class.send(:define_method, method) do
        case method
        when "black" then "\e[30m" + self.to_s + "\e[0m"
        when "red" then "\e[31m" + self.to_s + "\e[0m"
        when "green" then "\e[32m" + self.to_s + "\e[0m"
        when "yellow" then "\e[33m" + self.to_s + "\e[0m"
        when "blue" then "\e[34m" + self.to_s + "\e[0m"
        when "magenta" then "\e[35m" + self.to_s + "\e[0m"
        when "cyan" then "\e[36m" + self.to_s + "\e[0m"
        when "white" then "\e[37m" + self.to_s + "\e[0m"
        when "bright_black" then "\e[1m\e[30m" + self.to_s + "\e[0m"
        when "bright_red" then "\e[1m\e[31m" + self.to_s + "\e[0m"
        when "bright_green" then "\e[1m\e[32m" + self.to_s + "\e[0m"
        when "bright_yellow" then "\e[1m\e[33m" + self.to_s + "\e[0m"
        when "bright_blue" then "\e[1m\e[34m" + self.to_s + "\e[0m"
        when "bright_magenta" then "\e[1m\e[35m" + self.to_s + "\e[0m"
        when "bright_cyan" then "\e[1m\e[36m" + self.to_s + "\e[0m"
        when "bright_white" then "\e[1m\e[37m" + self.to_s + "\e[0m"
        end
      end and self.send(method, *args)
    end
  end
end

class String
  include Term::Colorizer
end
