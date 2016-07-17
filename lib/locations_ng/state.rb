module LocationsNg
  class State
    attr_accessor :state

    def initialize(state = 'all')
      @state = state
    end

    def states
      load_yaml('states').map { |s| {name: s['name'], capital: s['capital']} }
    end

    private

    def load_yaml(file)
      YAML.load(File.read(files_location file))
    end

    def files_location(file)
      File.expand_path("../locations/#{file}.yml", __FILE__)
    end
  end
end
