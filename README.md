# Locations NG
Locations NG is a gem that provides methods to get all states, their cities and LGAs in Nigeria. 

### Requirements
* Rails version
`v4.2.6`

* Ruby version
`>= 2.3.1`

## Getting Started

Add this line to your Gemfile

```bash
gem 'locations_ng'
```

And then execute:

```bash
$ bundle install
```

Or install it yourself

```bash
$ gem install locations_ng
```
## Usage

### Require the gem
```ruby
require 'locations_ng'
```

### 1. Get all States, canonical
```ruby
LocationsNg::State.new.states
```
#### Response
```json
[
  {:name=>"Abia", :capital=>"Umuahia"},
  {:name=>"Adamawa", :capital=>"Yola"},
  {:name=>"Akwa Ibom", :capital=>"Uyo"},
  ...
]
```

License
----

MIT
