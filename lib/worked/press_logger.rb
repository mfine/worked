module Worked
  class PressLogger
    include Press

    def initialize(type)
      @type = type
    end

    def debug(args)
      pd type: @type, level: __method__, message: args
    end

    def info(args)
      pd type: @type, level: __method__, message: args
    end

    def warn(args)
      pd type: @type, level: __method__, message: args
    end

    def error(args)
      pd type: @type, level: __method__, message: args
    end

    def fatal(args)
      pd type: @type, level: __method__, message: args
    end
  end
end
