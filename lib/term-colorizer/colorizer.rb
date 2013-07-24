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
    module ClassMethods
    end

    module InstanceMethods
      # returns array of available color methods
      def color_methods
       TERM_COLORS.keys
      end

      # overriden method_missing's default behaviour to
      # define the color methods on the fly when called
      def method_missing(method, *args, &block) #:nodoc:
        super unless TERM_COLORS.keys.include? method
        self.class.send(:define_method, method) do
          TERM_COLORS[method].sub(/STR/, self.to_s)
        end and self.send(method, *args)
      end

      # overriden respond_to? so as to it will return true
      # when asked for any of available color methods
      def respond_to_missing?(method, include_private = false) #:nodoc:
        TERM_COLORS.keys.include? method || super
      end
    end

    def self.included(base)
      base.extend         ClassMethods
      base.send :include, InstanceMethods
    end
  end
end

class String
  include Term::Colorizer
end
