module Operators
  class Sum
    def self.priority
      1
    end

    def self.matcher
      '\d+\+\d+'
    end
  end
end
