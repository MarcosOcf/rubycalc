require 'spec_helper'
require 'Rubycalc'

describe Rubycalc::ExpressionParser do
  let :args do
    'teste'
  end

  subject do
    Rubycalc::ExpressionParser.new args
  end

  context '#to_array' do
    it 'returns the given args in array format' do
      expect(subject.to_array.class).to equal Array
    end
  end
end
