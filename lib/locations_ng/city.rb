module LocationsNg
  class City
    def self.all
      load_cities
    end

    def self.cities(state)
      state = state.downcase.gsub(' ', '_')
      all_cities = load_cities

      city_index = all_cities.index{|c| c['alias'] == state}

      if city_index.nil?
        {message: "No cities found for '#{state}'", status: 404}
      else
        all_cities[city_index]['cities']
      end
    end

    private

    def self.load_cities
      YAML.load(File.read(files_location 'cities'))
    end

    def self.files_location(file)
      File.expand_path("../locations/#{file}.yml", __FILE__)
    end
  end
end
