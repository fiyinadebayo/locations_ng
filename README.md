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
  ...
  {:name=>"Zamfara",:capital=>"Gusau"}
]
```

### 2. Get all Cities
```ruby
LocationsNg::City.new.all
```
#### Response
```json
[
  {
    "state":"Akwa Ibom",
    "alias":"akwa_ibom",
    "cities":["Eket", "Ikot Ekpene", "Oron", "Uyo"]
  },
  {
    "state":"Bauchi",
    "alias":"bauchi",
    "cities":["Bauchi"]
  },
  ...
  ...
  {
    "state":"Zamfara",
    "alias":"zamfara",
    "cities":["Gusau"]
  }
]
```

### 3. Get Cities in a State
```ruby
LocationsNg::City.new.cities('Akwa Ibom')
```
#### Response
```json
['Eket', 'Ikot Ekpene', 'Oron', 'Uyo']
```

### 4. Get LGAs in a State
```ruby
LocationsNg::Lga.new.lgas('Lagos')
```
#### Response
```json
['Agege', 'Ajeromi-Ifelodun', 'Alimosho',
 'Amuwo-Odofin', 'Badagry', 'Apapa', 'Epe',
 'Eti Osa', 'Ibeju-Lekki', 'Ifako-Ijaiye',
 'Ikeja', 'Ikorodu', 'Kosofe', 'Lagos Island',
 'Mushin', 'Lagos Mainland', 'Ojo', 'Oshodi-Isolo',
 'Shomolu', 'Surulere Lagos State']
```

License
----

MIT
