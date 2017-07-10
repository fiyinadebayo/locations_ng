# Locations NG [![CircleCI](https://circleci.com/gh/ceemion/locations_ng/tree/master.svg?style=svg)](https://circleci.com/gh/ceemion/locations_ng/tree/master) [![Gem Version](https://badge.fury.io/rb/locations_ng.svg)](https://badge.fury.io/rb/locations_ng) [![Code Climate](https://codeclimate.com/github/ceemion/locations_ng/badges/gpa.svg)](https://codeclimate.com/github/ceemion/locations_ng) [![Issue Count](https://codeclimate.com/github/ceemion/locations_ng/badges/issue_count.svg)](https://codeclimate.com/github/ceemion/locations_ng)
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

### 1. GET all States, canonical
```ruby
LocationsNg::State.all
```
#### Response
```bash
[
  {:name=>"Abia", :capital=>"Umuahia"},
  {:name=>"Adamawa", :capital=>"Yola"},
  {:name=>"Akwa Ibom", :capital=>"Uyo"},
  ...
  ...
  {:name=>"Zamfara",:capital=>"Gusau"}
]
```

### 2. GET detailed data of a State
```ruby
LocationsNg::State.details('Lagos')
```
#### Response
```bash
{'minLat'=>6.3936419,
 'name'=>'Lagos',
 'capital'=>'Ikeja',
 'latitude'=>6.5243793,
 'minLong'=>3.0982732,
 'maxLat'=>6.7027984,
 'longitude'=>3.3792057,
 'maxLong'=>3.696727799999999,
 'alias'=>'lagos',
 'area'=>3345
 'cities'=>['Agege', 'Ikeja'],
 'lgas'=>['Agege', 'Ajeromi-Ifelodun', 'Alimosho',
          'Amuwo-Odofin', 'Badagry', 'Apapa', 'Epe',
          'Eti Osa', 'Ibeju-Lekki', 'Ifako-Ijaiye',
          'Ikeja', 'Ikorodu', 'Kosofe', 'Lagos Island',
          'Mushin', 'Lagos Mainland', 'Ojo', 'Oshodi-Isolo',
          'Shomolu', 'Surulere Lagos State']
}
```

### 3. GET State capital
```ruby
LocationsNg::State.capital('Lagos')
```
#### Response
```bash
Ikeja
```

### 4. GET all Cities
```ruby
LocationsNg::City.all
```
#### Response
```bash
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

### 5. GET Cities in a State
```ruby
LocationsNg::City.cities('Akwa Ibom')
```
#### Response
```bash
['Eket', 'Ikot Ekpene', 'Oron', 'Uyo']
```

### 6. GET all LGAs
```ruby
LocationsNg::Lga.all
```
#### Response
```bash
[
  {
    "state"=>"Adamawa",
    "alias"=>"adamawa",
    "lgas"=>[
      "Demsa",
      "Fufure",
      "Ganye",
      "Gayuk",
      "Gombi",
      "Grie",
      "Hong",
      "Jada",
      "Larmurde",
      "Madagali",
      "Maiha",
      "Mayo Belwa",
      "Michika",
      "Mubi North",
      "Mubi South",
      "Numan",
      "Shelleng",
      "Song",
      "Toungo",
      "Yola North",
      "Yola South"
    ]
  },
  ...
  ...
  {
    "state"=>"Abia",
    "alias"=>"abia",
    "lgas"=>[
      "Aba North",
      "Arochukwu",
      "Aba South",
      "Bende",
      "Isiala Ngwa North",
      "Ikwuano",
      "Isiala Ngwa South",
      "Isuikwuato",
      "Obi Ngwa",
      "Ohafia",
      "Osisioma",
      "Ugwunagbo",
      "Ukwa East",
      "Ukwa West",
      "Umuahia North",
      "Umuahia South",
      "Umu Nneochi"
    ]
  }
]
```

### 7. GET LGAs in a State
```ruby
LocationsNg::Lga.lgas('Lagos')
```
#### Response
```bash
['Agege', 'Ajeromi-Ifelodun', 'Alimosho',
 'Amuwo-Odofin', 'Badagry', 'Apapa', 'Epe',
 'Eti Osa', 'Ibeju-Lekki', 'Ifako-Ijaiye',
 'Ikeja', 'Ikorodu', 'Kosofe', 'Lagos Island',
 'Mushin', 'Lagos Mainland', 'Ojo', 'Oshodi-Isolo',
 'Shomolu', 'Surulere Lagos State']
```

### 8. GET Localities for LGAs in a State (query with *state* and *LGA*)
```ruby
LocationsNg::Lga.localities('Abia', 'Aba North')
```
#### Response
```bash
['Ariaria', 'Asaokpoja', 'Asaokpulor',
 'Eziama  ward', 'Industrial', 'Ogbor 1',
 'Ogbor 2', 'Old GRA', 'Osusu 1', 'Osusu 2',
 'St. Eugene', 'Umuogor', 'Umuola', 'Uratta']
```

## Contributing
* Fork this repository
* Create a new branch
* make your changes
* Create a Pull Request


License
----

MIT
