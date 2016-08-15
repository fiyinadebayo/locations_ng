module LocationsNg
  class LoadFile
    class << self
      def read(file_name)
        YAML.load(File.read(files_location file_name))
      end

      def files_location(file)
        File.expand_path("../locations/#{file}.yml", __FILE__)
      end
    end
  end
end
