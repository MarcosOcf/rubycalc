module Operators
  class Sum
    def self.priority
      1
    end

    def self.matcher
      '\d+\+\d+'
    end

    def self.solve args
      args[0] + args[1]
    end
  end
end
