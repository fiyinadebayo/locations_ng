module LocationsNg
  class State
    @all_states = LocationsNg::LoadFile.read('states')

    class << self
      def all
        @all_states.map{ |s| {name: s['name'], capital: s['capital']} }
      end

      def details(state)
        state_index = @all_states.index{ |s| s['alias'] == format_query(state) }

        if state_index.nil?
          {message: "No state found for '#{state}'", status: 404}
        else
          res = @all_states[state_index]
          res['cities'] = LocationsNg::City.cities(state)
          res['lgas'] = LocationsNg::Lga.lgas(state)
          res
        end
      end

      def capital(state)
        state_index = @all_states.index{ |s| s['alias'] == format_query(state) }

        unless state_index.nil?
          return @all_states[state_index]['capital']
        end

        {message: "No state found for '#{state}'", status: 404}
      end

      private

      def format_query(query)
        query ? query.downcase.tr(' ', '_') : query
      end
    end
  end
end
