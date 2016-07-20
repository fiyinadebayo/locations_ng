module LocationsNg
  class Lga
    def lgas(state)
      state = state.downcase.gsub(' ', '_')

      res = load_lgas.map{|l| l[0] if l[1] == state.capitalize}.compact
      res.empty? ? {message: "No lgas found for '#{state}'", :status=>404} : res
    end

    private

    def load_lgas
      YAML.load(File.read(files_location 'lgas'))
    end

    def files_location(file)
      File.expand_path("../locations/#{file}.yml", __FILE__)
    end
  end
end
