module Rubycalc
  class Iterator
    attr_reader :args

    def initialize args
      @args = args
      @reader = Rubycalc::Reader.new
    end

    def next_step
      step = @reader.who_is_next? @args
      params = to_params step[:expression]
      result = step[:operator].solve params
      step.merge({ result: result })
    end

    private
    def to_params expression
      result = expression.scan(/\d+/)
      result.map {|x| x.to_f}
    end
  end
end