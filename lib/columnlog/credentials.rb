module Columnlog
  class Credentials

    @@default_path = File.join(File.dirname(__FILE__), '..', '..', 'config', 'credentials.yml')
    @@credentials = nil
    
    class << self
      def load(from_path = nil)
        from_path ||= @@default_path
        @@credentials = SuperHash.new(YAML.load_file(from_path))
      end

      def get(*credentials)
        load unless self.loaded?
        @@credentials.deep_value(*credentials) || raise("No credentials for '#{credentials}'")
      end
      
      def loaded?
        @@credentials || @credentials.is_a?(SuperHash)
      end
    end
  end
end