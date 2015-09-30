require 'spec_helper'

describe ThatLanguage::ResultSet do
  subject(:result_set) { described_class.new(2) }

  describe "#initialize(words_count)" do
    pending
  end

  describe "#for(language_code)" do
    subject { result_set.for(language_code) }
    let(:language_code) { :de }

    it { is_expected.to be_kind_of(ThatLanguage::Result) }
    it "returns the same Result when calling twice" do
      expect(subject).to eq(result_set.for(language_code))
    end
  end

  describe "#results" do
    subject { result_set.results }

    context "without any result" do
      it { is_expected.to eq([]) }
    end

    context "with results" do
      before do
        result_set.for(:de)
        result_set.for(:en)
      end

      specify { expect(subject.length).to eq(2) }
    end
  end

  describe "#winner" do
    subject { result_set.winner }
    let(:first_result) { result_set.for(:de) }
    let(:second_result) { result_set.for(:en) }
    let(:third_result) { result_set.for(:fr) }

    before do
      first_result.add(0.1)
      second_result.add(0.3)
      third_result.add(0.2)
    end

    its(:confidence) { is_expected.to be > 0.1 }
    its(:confidence) { is_expected.to be < 0.2 }
    its(:winner?) { is_expected.to eq(true) }

    it "returns result with highest value" do
      expect(subject).to eq(second_result)
    end
  end

  describe "#to_h" do
    subject { result_set.to_h }

    it { is_expected.to be_a(Hash) }
    it { is_expected.to include(:results) }
  end

  describe "#to_json" do
    subject { result_set.to_json }
    it { is_expected.to be_a(String) }
  end

  describe ".included_modules" do
    subject { described_class.included_modules }
    it { is_expected.to include(Enumerable) }
  end
end
