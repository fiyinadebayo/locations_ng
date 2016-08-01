module LocationsNg
  class Lga
    def self.all
      load_lgas
    end

    def self.lgas(state)
      query = format_query(state)
      all_lgas = load_lgas

      lga_index = all_lgas.index{|l| l['state_alias'] == query}

      if lga_index.nil?
        {message: "No lgas found for '#{state}'", status: 404}
      else
        all_lgas[lga_index]['lgas']
      end
    end

    def self.localities(state, lga)
      return {message: 'You must enter a state and lga.', status: 500} unless state && lga

      state_query = format_query(state)
      lga_query = format_query(lga)
      all_lgas = load_lgas

      state_index = all_lgas.index{|s| s['state_alias'] == state_query}

      if state_index
        lga_index = all_lgas[state_index]['locality'].index{|l| l['lga_alias'] == lga_query}

        if lga_index
          all_lgas[state_index]['locality'][lga_index]['localities']
        else
          {message: "'#{lga}' LGA not found for '#{state}' state.", status: 404}
        end
      else
        {message: "'#{state}' state not found.", status: 404}
      end
    end

    private

    def self.load_lgas
      YAML.load(File.read(files_location 'lgas'))
    end

    def self.files_location(file)
      File.expand_path("../locations/#{file}.yml", __FILE__)
    end

    def self.format_query(query)
      query ? query.downcase.gsub(' ', '_') : query
    end
  end
end
