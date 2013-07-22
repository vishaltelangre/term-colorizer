module Term
  module Colorizer
    TERM_COLORS = {
      :black          => "\e[30mSTR\e[0m",
      :red            => "\e[31mSTR\e[0m",
      :green          => "\e[32mSTR\e[0m",
      :yellow         => "\e[33mSTR\e[0m",
      :blue           => "\e[34mSTR\e[0m",
      :magenta        => "\e[35mSTR\e[0m",
      :cyan           => "\e[36mSTR\e[0m",
      :white          => "\e[37mSTR\e[0m",
      :bright_black   => "\e[1m\e[30mSTR\e[0m",
      :bright_red     => "\e[1m\e[31mSTR\e[0m",
      :bright_green   => "\e[1m\e[32mSTR\e[0m",
      :bright_yellow  => "\e[1m\e[33mSTR\e[0m",
      :bright_blue    => "\e[1m\e[34mSTR\e[0m",
      :bright_magenta => "\e[1m\e[35mSTR\e[0m",
      :bright_cyan    => "\e[1m\e[36mSTR\e[0m",
      :bright_white   => "\e[1m\e[37mSTR\e[0m"
    }

    def method_missing(method, *args, &block)
      super unless TERM_COLORS.keys.include? method
      self.class.send(:define_method, method) do
        TERM_COLORS[method].sub(/STR/, self.to_s)
      end and self.send(method, *args)
    end
  end
end

class String
  include Term::Colorizer
end
