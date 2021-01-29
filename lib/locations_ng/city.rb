module LocationsNg
  class City
    @all_cities = LoadFile.read('cities')

    class << self
      def all
        @all_cities
      end

      def cities(state)
        state_query = state_query(state.downcase.tr(' ', '_'))
        city_index = @all_cities.index{ |c| c['alias'] == state_query }

        unless city_index.nil?
          return @all_cities[city_index]['cities']
        end

        {message: "No cities found for '#{state}'", status: 404}
      end

      private

      def state_query(state)
        state == 'federal_capital_territory' ? 'fct' : state
      end
    end
  end
end
