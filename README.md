# Validb

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

## License
Released under the MIT License
