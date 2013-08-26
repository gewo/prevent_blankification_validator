# PreventBlankificationValidator

[![Build Status](https://travis-ci.org/gewo/prevent_blankification_validator.png)](https://travis-ci.org/gewo/prevent_blankification_validator/)
[![Code Coverage](https://coveralls.io/repos/gewo/prevent_blankification_validator/badge.png)](https://coveralls.io/r/gewo/prevent_blankification_validator)
[![Code Climate](https://codeclimate.com/github/gewo/prevent_blankification_validator.png)](https://codeclimate.com/github/gewo/prevent_blankification_validator)
[![Gem Version](https://badge.fury.io/rb/prevent_blankification_validator.png)](http://badge.fury.io/rb/prevent_blankification_validator)
[![Dependency Status](https://gemnasium.com/gewo/prevent_blankification_validator.png)](https://gemnasium.com/gewo/prevent_blankification_validator)

Rails 3 Validator, that prevents attributes from being changed to a blank value
once they're present.

## Installation

Add this line to your application's Gemfile:

    gem 'prevent_blankification_validator'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install prevent_blankification_validator

## Usage

```ruby
class MyModel
  validates :value, prevent_blankification: true
end

model.value = 'present'
model.save             # => true

model.value = ''
model.valid?           # => false

model.value = "\r    \n  "
model.valid?           # => false

model.value = nil
model.valid?           # => false

model.value = 'present as well'
model.valid?           # => true

```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
