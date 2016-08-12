module LocationsNg
  class City
    @@all_cities

    class << self
      def all
        load_cities
      end

      def state_query(state)
        state == 'federal_capital_territory' ? 'fct' : state
      end

      def cities(state)
        load_cities
        state_query = self.state_query(state.downcase.gsub(' ', '_'))

        city_index = @@all_cities.index{ |c| c['alias'] == state_query }

        unless city_index.nil?
          return @@all_cities[city_index]['cities']
        end

        {message: "No cities found for '#{state}'", status: 404}
      end

      private
      def load_cities
        @@all_cities ||= YAML.load(File.read(files_location 'cities'))
      end

      def files_location(file)
        File.expand_path("../locations/#{file}.yml", __FILE__)
      end
    end
  end
end
