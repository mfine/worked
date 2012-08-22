module Worked
  module Conf

    def self.optional(*attrs)
      attrs.each do |attr|
        instance_eval "def #{attr}; @#{attr} ||= ENV['#{attr.upcase}'] end", __FILE__, __LINE__
      end
    end

    def self.mandatory(*attrs)
      attrs.each do |attr|
        instance_eval "def #{attr}; @#{attr} ||= ENV['#{attr.upcase}'] || raise(Error::MissingConfig, '#{attr.upcase}') end", __FILE__, __LINE__
      end
    end

    mandatory :port

    def self.override(attrs)
      attrs.each do |attr, value|
        instance_eval "def #{attr}; @#{attr} ||= ENV['#{attr.upcase}'] || '#{value}'.to_s end", __FILE__, __LINE__
      end
    end

    override app_name:  "worked"

    def self.method_missing(m, *_)
      raise(Error::UnknownConfig, m.to_s.upcase)
    end
  end
end
