module LocationsNg
  class Lga
    @@all_lgas

    class << self
      def all
        load_lgas
      end

      def lgas(state)
        load_lgas

        lga_index = @@all_lgas.index{ |l| l['state_alias'] == format_query(state) }

        unless lga_index.nil?
          return @@all_lgas[lga_index]['lgas']
        end

        {message: "No lgas found for '#{state}'", status: 404}
      end

      def localities(state, lga)
        return {message: 'You must enter a state and lga.', status: 500} unless state && lga

        load_lgas

        state_index = @@all_lgas.index{ |s| s['state_alias'] == format_query(state) }

        unless state_index
          return {message: "'#{state}' state not found.", status: 404}
        end

        lga_index = @@all_lgas[state_index]['locality'].index{ |l| l['lga_alias'] == format_query(lga) }

        unless lga_index
          return {message: "'#{lga}' LGA not found for '#{state}' state.", status: 404}
        end

        @@all_lgas[state_index]['locality'][lga_index]['localities']
      end

      private
      def load_lgas
        @@all_lgas ||= YAML.load(File.read(files_location 'lgas'))
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
