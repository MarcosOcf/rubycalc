module Rubycalc
  class Expression
    attr_reader :args

    def initialize args
      @args = args
    end

    def solve
      Rubycalc::Iterator.new(@args)
    end
  end
end