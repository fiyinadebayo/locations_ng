module LocationsNg
  class City
    class << self
      def all
        load_cities
      end

      def cities(state)
        state_query = state.downcase.gsub(' ', '_')
        all_cities = load_cities

        if state_query == 'federal_capital_territory'
          state_query = 'fct'
        end

        city_index = all_cities.index{|c| c['alias'] == state_query}

        if city_index.nil?
          {message: "No cities found for '#{state}'", status: 404}
        else
          all_cities[city_index]['cities']
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
end
