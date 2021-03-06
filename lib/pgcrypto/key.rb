module PGCrypto
  class KeyManager < Hash
    def []=(key, value)
      unless value.is_a?(Key)
        value = Key.new(value)
      end
      value.name = key
      super key, value
    end
  end

  class Key
    attr_accessor :name, :password, :value
    attr_reader :path
    attr_writer :armored

    def armored?
      @armored
    end

    def dearmored
      "#{'dearmor(' if armored?}'#{self}'#{')' if armored?}"
    end

    def initialize(options = {})
      if options.is_a?(String)
        self.value = options
      elsif options.is_a?(Hash)
        options.each do |key, value|
          send("#{key}=", value)
        end
      end
    end

    def path=(keyfile)
      keyfile = File.expand_path(keyfile)
      raise PGCrypto::Error, "#{keyfile} does not exist!" unless File.file?(keyfile)
      @path = keyfile
      self.value = File.read(keyfile)
    end

    def to_s
      value
    end

    def value=(key)
      if key =~ /^-----BEGIN PGP /
        self.armored = true
      else
        self.armored = false
      end
      @value = key.dup.freeze
    end
  end
end
