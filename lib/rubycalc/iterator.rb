module Rubycalc
  class Iterator
    attr_reader :args

    def initialize args
      @args = args
    end

    def next_step
      Rubycalc::Reader.new.who_is_next? @args
    end
  end
end