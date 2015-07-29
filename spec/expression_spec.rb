require 'spec_helper'
require 'Rubycalc'

describe Rubycalc::Expression do
  let :args do
    '1+2'
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
      expect(subject.solve).to eq 3
    end

    context do
      let :args do
        '1+2+5'
      end
      it 'returns the solved equation' do
        expect(subject.solve).to eq 8
      end
    end
  end
end
