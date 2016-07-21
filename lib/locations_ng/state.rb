module LocationsNg
  class State
    def self.all
      load_states.map{ |s| {name: s['name'], capital: s['capital']} }
    end

    def self.details(state)
      state = state.downcase.gsub(' ', '_')
      all_states = load_states

      state_index = all_states.index{|s| s['alias'] == state}

      if state_index.nil?
        {message: "No state found for '#{state}'", status: 404}
      else
        res = all_states[state_index].with_indifferent_access
        res['cities'] = LocationsNg::City.new.cities(state)
        res['lgas'] = LocationsNg::Lga.lgas(state)
        res
      end
    end

    def self.capital(state)
      state = state.downcase.gsub(' ', '_')
      all_states = load_states

      state_index = all_states.index{|s| s['alias'] == state}

      if state_index.nil?
        {message: "No state found for '#{state}'", status: 404}
      else
        all_states[state_index]['capital']
      end
    end

    private

    def self.load_states
      YAML.load(File.read(files_location 'states'))
    end

    def self.files_location(file)
      File.expand_path("../locations/#{file}.yml", __FILE__)
    end
  end
end
