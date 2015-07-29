module Rubycalc
  class Expression
    attr_reader :args

    def initialize args
      @args = args
    end

    def solve
      all_steps = Rubycalc::Iterator.new(@args).all_steps
      all_steps[:result]
    end
  end
end