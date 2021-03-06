require 'spec_helper'
require 'Rubycalc'

describe Rubycalc::Iterator do

  let :args do
    '1-2+3'
  end

  subject do
    Rubycalc::Iterator.new args
  end

  it 'returns an instance of Rubycalc::Expression' do
    expect(subject).to be_an_instance_of(Rubycalc::Iterator)
  end

  describe '#next_step' do
    context 'on success scenario'do
      let :result do
        {
          expression:"2+3",
          starts_at: 2,
          operator: Operators::Addition,
          result: 5.0
        }
      end

      it 'expect to return params of next_step' do
        expect(subject.next_step).to eq result
      end
    end

    context 'on failed scenario' do
      let :args do
        '2=3'
      end

      it 'expect to return nil as next_step' do
        expect(subject.next_step).to be_nil
      end
    end
  end
end