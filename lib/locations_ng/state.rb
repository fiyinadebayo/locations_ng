module LocationsNg
  class State
    class << self
      def all
        load_states.map{ |s| {name: s['name'], capital: s['capital']} }
      end

      def details(state)
        state_query = format_query(state)
        all_states = load_states

        state_index = all_states.index{|s| s['alias'] == state_query}

        if state_index.nil?
          {message: "No state found for '#{state}'", status: 404}
        else
          res = all_states[state_index].with_indifferent_access
          res['cities'] = LocationsNg::City.cities(state)
          res['lgas'] = LocationsNg::Lga.lgas(state)
          res
        end
      end

      def capital(state)
        state_query = format_query(state)
        all_states = load_states

        state_index = all_states.index{|s| s['alias'] == state_query}

        if state_index.nil?
          {message: "No state found for '#{state}'", status: 404}
        else
          all_states[state_index]['capital']
        end
      end

      private

      def load_states
        YAML.load(File.read(files_location 'states'))
      end

      def files_location(file)
        File.expand_path("../locations/#{file}.yml", __FILE__)
      end

      def format_query(query)
        query ? query.downcase.gsub(' ', '_') : query
      end
    end
  end
end
