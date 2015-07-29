module Rubycalc
  class ExpressionParser
    attr_reader :args

    def initialize args
      @args = args
    end

    def to_array
      @args.split('')
    end
  end
end
