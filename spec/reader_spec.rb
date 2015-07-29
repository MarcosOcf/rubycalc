require 'spec_helper'
require 'Rubycalc'

describe Rubycalc::Reader do
  let :args do
    '1+2+3'
  end

  subject do
    Rubycalc::Reader.new
  end

  describe '#find' do
    let :expression do
      '1+2+3'
    end

    let :pattern do
      '\d+\+\d+'
    end

    context 'on success scenario' do
      let :result do
        {
          starts_at: 0,
          expression: '1+2'
        }
      end

      it 'returns a hash with expression and the starts_at point' do
        expect(subject.find(expression, pattern)).to eq result
      end
    end

    context 'on failed scenario' do
      let :expression do
        '1-3'
      end

      it 'returns a hash with expression and the starts_at point' do
        expect(subject.find(expression, pattern)).to be_nil
      end
    end
  end

  describe '#who_is_next?' do
    context 'on success scenario' do
      let :expected_result do
        {
          operator: Operators::Sum,
          starts_at: 0,
          expression: '1+2'
        }
      end

      it 'expect #who_is_next? to return equation result' do
        expect(subject.who_is_next? args).to eq expected_result
      end
    end

    context 'on failed scenario' do
      let :expected_result do
        nil
      end

      let :args do
        '1-2-4'
      end

      it 'expect#who_is_next? to return nil' do
        expect(subject.who_is_next? args).to eq expected_result
      end
    end
  end
end
