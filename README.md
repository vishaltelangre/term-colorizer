Term::Colorizer
===============

[![Gem Version](https://badge.fury.io/rb/term-colorizer.png)](http://badge.fury.io/rb/term-colorizer)
[![Build Status](https://travis-ci.org/vishaltelangre/term-colorizer.png?branch=master)](https://travis-ci.org/vishaltelangre/term-colorizer)

Print colorized strings on terminal (Useful for printing fancy logs)

## Installation

Install gem by using following command:

    gem install term-colorizer

or add it to your Gemfile as:

```ruby
gem 'term-colorizer', require: 'term-colorizer'
```

## Usage

``` ruby
"Duck can quack".green
# => "\e[32mDuck can quack\e[0m"

puts "Wow, that's really".underline + " cool ".black.strikethrough + "hot!".bg_red.bright_yellow
# guess what it will do?
```

To see all accessible methods provided by term-colorizer, use:

```ruby
>> "Hello".term_colorizer_methods
=> [:black, :red, :green, :yellow, :blue, :magenta, :cyan, :white, :bright_black, :bright_red, :bright_green, :bright_yellow, :bright_blue, :bright_magenta, :bright_cyan, :bright_white, :bg_black, :bg_red, :bg_green, :bg_yellow, :bg_blue, :bg_magenta, :bg_cyan, :bg_white, :underline, :strikethrough, :term_colorizer_methods, :fancy_color_methods, :no_underline, :no_strikethrough, :no_color, :no_bg_color, :plain_text, :reset_fancyness]
```


To see available color methods only:

```ruby
>> "Hello".color_methods
=> [:black, :red, :green, :yellow, :blue, :magenta, :cyan, :white]
```


To see available bright (bold) color methods only:

```ruby
>> "Hello".bright_color_methods
=> [:bright_black, :bright_red, :bright_green, :bright_yellow, :bright_blue, :bright_magenta, :bright_cyan, :bright_white]
```


To see available background color methods only:

```ruby
>> "Hello".bg_color_methods
=> [:bg_black, :bg_red, :bg_green, :bg_yellow, :bg_blue, :bg_magenta, :bg_cyan, :bg_white]
```

## Screenshots

![term-colorizer-screenshot-1!](https://raw.github.com/vishaltelangre/term-colorizer/master/screenshot_1.png)

And, for sake -- also added bunch of reset methods, viz. `plain_text`, `reset_fancyness`, `no_color`, `no_bg_color`, `no_underline`, `no_strikethrough`.
You can use 'em as:

```ruby
>> "That's it, boy!".green.bg_yellow.plain_text
=> "That's it, boy!"
```

![term-colorizer-screenshot-2!](https://raw.github.com/vishaltelangre/term-colorizer/master/screenshot_2.png)

:yum:

## Contributing

You're encouraged to contribute to this gem.

* Fork this project.
* Make changes, write tests.
* Report bugs, comment on and close open issues.
* Updated [CHANGELOG](CHANGELOG.md).
* Make a pull request, bonus points for topic branches.

## Copyright and License

Copyright (c) 2013, Vishal Telangre and [Contributors](CHANGELOG.md). All Rights Reserved.

This project is licenced under the [MIT License](LICENSE.md).

<a target='_blank' rel='nofollow' href='https://app.codesponsor.io/link/PfwgcRiC73ERAe1WTDUo4DmM/vishaltelangre/term-colorizer'>
  <img alt='Sponsor' width='888' height='68' src='https://app.codesponsor.io/embed/PfwgcRiC73ERAe1WTDUo4DmM/vishaltelangre/term-colorizer.svg' />
</a>
