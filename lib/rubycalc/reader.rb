require 'byebug'
module Rubycalc
  class Reader
    def initialize
      @operators = sort_operators
    end

    def who_is_next? args
      @operators.each do |operator|
        match = find args, operator.matcher
        return match.merge({type: operator}) if match
      end
      nil
    end

    def find expression, pattern
      regexp = Regexp.new(pattern)
      match_expression = expression[regexp]
      if match_expression
        return {
          expression: match_expression,
          starts_at: expression =~ regexp
        }
      end
    end

    private
    def sort_operators
      operators = Operators.constants.sort_by { |symbol|
        Operators.const_get(symbol).priority
      }

      operators.map! { |sym|
        Operators.const_get(sym)
      }
    end
  end
end