Term::Colorizer
===============

[![Gem Version](https://badge.fury.io/rb/term-colorizer.png)](http://badge.fury.io/rb/term-colorizer)
[![Build Status](https://travis-ci.org/vishaltelangre/term-colorizer.png?branch=master)](https://travis-ci.org/vishaltelangre/term-colorizer)

Print colorized strings on terminal (Useful for printing fancy logs)

## Usage

Install gem by using following command:

    gem install term-colorizer

or add it to your Gemfile as:

```ruby
gem 'term-colorizer', require: 'term-colorizer'
```

and use it as:

``` ruby
"Duck can quack".green
# => "\e[32mDuck can quack\e[0m"

puts "Wow, that's really " + "hot!".bright_red
# guess what it will do?
```

To know avaialable color methods:
```ruby
"Hello world!".color_methods
# => [:black, :red, :green, :yellow, :blue, :magenta, :cyan, :white, :bright_black, :bright_red, :bright_green, :bright_yellow, :bright_blue, :bright_magenta, :bright_cyan, :bright_white]
```

:)

## Contributing

You're encouraged to contribute to this gem.

* Fork this project.
* Make changes, write tests.
* Updated [CHANGELOG](CHANGELOG.md).
* Make a pull request, bonus points for topic branches.

## Copyright and License

Copyright (c) 2013, Vishal Telangre and [Contributors](CHANGELOG.md). All Rights Reserved.

This project is licenced under the [MIT License](LICENSE.md).
