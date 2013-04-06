# Validb

[![Gem Version](https://badge.fury.io/rb/validb.png)](https://rubygems.org/gems/validb)
[![Dependency Status](https://gemnasium.com/jgeiger/validb.png)](https://gemnasium.com/jgeiger/validb)
[![Build Status](https://travis-ci.org/jgeiger/validb.png)](https://travis-ci.org/jgeiger/validb)
[![Code Climate](https://codeclimate.com/github/jgeiger/validb.png)](https://codeclimate.com/github/jgeiger/validb)

## Description

Check your database for invalid models.

## Installation
Add this line to your Gemfile

    gem 'validb'

And then:

    bundle

## Usage

### Generate config file in config/validb.json
    rake validb:generate_config

#### Example validb.json file

    {
      "ignored_models": [
        "Blog",
        "Post"
      ],
      "ignored_prefixes": [
        "Api"
      ],
      "batch_size": 1000
    }

### Launch sidekiq
    sidekiq -L log/sidekiq.log

### Validate all model records
    rake validb:validate 

### Validate specific model records
    rake validb:validate models="Blog,Comment"

## Uses
[sidekiq](http://mperham.github.io/sidekiq)

[sidekiq_status](https://github.com/cryo28/sidekiq_status)

## License
Released under the MIT License
