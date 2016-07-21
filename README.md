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
LocationsNg::State.new.all
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

### 2. Get detailed data of a State
```ruby
LocationsNg::State.new.details('Lagos')
```
#### Response
```json
{'minLat'=>6.3936419,
 'name'=>'Lagos',
 'capital'=>'Ikeja',
 'latitude'=>6.5243793,
 'minLong'=>3.0982732,
 'maxLat'=>6.7027984,
 'longitude'=>3.3792057,
 'maxLong'=>3.696727799999999,
 'alias'=>'lagos',
 'cities'=>['Agege', 'Ikeja'],
 'lgas'=>['Agege', 'Ajeromi-Ifelodun', 'Alimosho',
          'Amuwo-Odofin', 'Badagry', 'Apapa', 'Epe',
          'Eti Osa', 'Ibeju-Lekki', 'Ifako-Ijaiye',
          'Ikeja', 'Ikorodu', 'Kosofe', 'Lagos Island',
          'Mushin', 'Lagos Mainland', 'Ojo', 'Oshodi-Isolo',
          'Shomolu', 'Surulere Lagos State']
}
```

### 3. Get State capital
```ruby
LocationsNg::State.new.capital('Lagos')
```
#### Response
```json
Ikeja
```

### 4. Get all Cities
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

### 5. Get Cities in a State
```ruby
LocationsNg::City.new.cities('Akwa Ibom')
```
#### Response
```json
['Eket', 'Ikot Ekpene', 'Oron', 'Uyo']
```

### 6. Get all LGAs
```ruby
LocationsNg::Lga.new.all
```
#### Response
```json
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

### 7. Get LGAs in a State
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
