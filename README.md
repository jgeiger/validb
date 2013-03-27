# Validb

[![Gem Version](https://badge.fury.io/rb/validb.png)](https://rubygems.org/gems/validb)
[![Dependency Status](https://gemnasium.com/jgeiger/validb.png)](https://gemnasium.com/jgeiger/validb)
[![Build Status](https://travis-ci.org/jgeiger/validb.png)](https://travis-ci.org/jgeiger/validb)

## Description

Check your database for invalid models.

## Installation
    gem install validb

### Rails 3 In Gemfile

    gem 'validb'

## Usage

### All models, default logger
    rake validb:validate 

### Specific models
    rake validb:validate models="Model,Model"

### Specific logger
    rake validb:validate logger="Validb::ConsoleLogger"

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
      ]
    }

## License
Released under the MIT License
