require 'spec_helper'
require 'Rubycalc'

describe Rubycalc::Iterator do

  let :args do
    'teste'
  end

  subject do
    Rubycalc::Iterator.new args
  end

  it 'returns an instance of Rubycalc::Expression' do
    expect(subject).to be_an_instance_of(Rubycalc::Iterator)
  end
end