require 'spec_helper'
require 'Rubycalc'

describe Rubycalc::Expression do
  let :args do
    'teste'
  end

  subject do
    Rubycalc::Expression.new args
  end

  it 'returns an instance of Rubycalc::Expression' do
    expect(subject).to be_an_instance_of(Rubycalc::Expression)
  end

  it 'returns the given args' do
    expect(subject.args).to equal args
  end

  context '#solve' do
    it 'returns the solved equation' do
      expect(subject.solve).to be_an_instance_of(Rubycalc::Iterator)
    end

    it 'expect Rubycalc::Iterator args to be an String' do
      expect(subject.solve.args.class).to equal String
    end
  end
end
