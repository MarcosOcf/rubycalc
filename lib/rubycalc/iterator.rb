module Rubycalc
  class Iterator
    attr_reader :args

    def initialize args
      @args = args
      @reader = Rubycalc::Reader.new
    end

    def next_step
      step = @reader.who_is_next? @args
      return nil if !step
      params = to_params step[:expression]
      result = step[:operator].solve params
      step.merge({ result: result })
    end

    def all_steps
      condition = true
      steps = []
      while condition
        params = next_step
        if params
          steps << params
          update_equation params
        else
          condition = false
        end
      end
      puts steps
      steps.last
    end

    private
    def update_equation params
      @args.slice!(params[:starts_at], params[:expression].length)
      @args.insert(params[:starts_at], params[:result].to_s)
    end

    def to_params expression
      result = expression.scan(/\d+/)
      result.map {|x| x.to_i}
    end
  end
end