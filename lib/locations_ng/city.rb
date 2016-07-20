module LocationsNg
  class City
    def all
      load_cities
    end

    def cities(state)
      state = state.downcase.gsub(' ', '_')
      city_index = load_cities.index{|c| c['alias'] == state}

      if city_index.nil?
        {message: "No cities found for '#{state}'", status: 404}
      else
        load_cities[city_index]['cities']
      end
    end

    private

    def load_cities
      YAML.load(File.read(files_location 'cities'))
    end

    def files_location(file)
      File.expand_path("../locations/#{file}.yml", __FILE__)
    end
  end
end
