Term::Colorizer
===============

[![Build Status](https://travis-ci.org/vishaltelangre/term-colorizer.png)](https://travis-ci.org/vishaltelangre/term-colorizer)

Print colorized strings on terminal (Useful for printing fancy logs)

## Usage

``` ruby
"Duck can quack".green
# => "\e[32mDuck can quack\e[0m"

puts "Wow, that's really " + "hot!".bright_red
# guess what it will do?

# Below are the bonus methods for your strings, which you can use as demonstrated above:

# black, red, green, yellow, blue, magenta, cyan, white, bright_black, bright_red,
# bright_green,bright_yellow, bright_blue, bright_magenta, bright_cyan, bright_white
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
