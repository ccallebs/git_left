require 'spec_helper'

describe GitLeft::KeyParser do
  describe '#action' do
    subject { described_class.new(input).action }

    context 'with h input' do
      let(:input) { 'h' }

      it { is_expected.to eq(:delete) }
    end

    context 'with l input' do
      let(:input) { 'l' }

      it { is_expected.to eq(:skip) }
    end

    context 'with anything else' do
      let(:input) { 'o' }

      it { is_expected.to eq(:quit) }
    end
  end
end
