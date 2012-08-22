module Hue
  module Error

    class UnknownConfig < StandardError
    end

    class MissingConfig < StandardError
    end

    class InvalidArgument < StandardError
    end

    class UnknownAttr < StandardError
    end

    class UnknownValue < StandardError
    end

    class BadHealth < StandardError
    end

    class Unavailable < StandardError
    end
  end
end
