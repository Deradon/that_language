require 'spec_helper'

describe ThatLanguage::Result do
  subject(:result) { described_class.new(language_code: language_code) }

  let(:language_code) { :de }

  describe ".initialize" do
    context "without language_code" do
      it "raises an ArgumentError" do
        expect { described_class.new }.to raise_error(ArgumentError)
      end
    end
  end

  its(:language_code) { is_expected.to eq(:de) }
  its(:value) { is_expected.to eq(0) }
  its(:hit_count) { is_expected.to eq(0) }
  its(:words_count) { is_expected.to eq(0) }

  describe "#add(value)" do
    before { subject.add(value_to_add) }

    context "when value is 0" do
      let(:value_to_add) { 0 }

      its(:value) { is_expected.to eq(0) }
      its(:hit_count) { is_expected.to eq(0) }
    end

    context "when value is > 0" do
      let(:value_to_add) { 0.1 }

      its(:value) { is_expected.to eq(0.1) }
      its(:hit_count) { is_expected.to eq(1) }
    end
  end

  describe "#words_count=" do
    before { subject.words_count = 42 }
    its(:words_count) { is_expected.to eq(42) }
  end

  describe "#hit_ratio" do
    subject { result.hit_ratio }

    before do
      result.add(0.5)
      result.words_count = 2
    end

    it { is_expected.to eq(1.to_f/2) }

    context "when words_count is 0" do
      before { result.words_count = 0 }
      it { is_expected.to eq(0) }
    end
  end

  describe "#confidence" do
    subject { result.confidence }

    context "when no value was added" do
      it { is_expected.to eq(0) }
    end

    context "with value added" do
      before do
        result.add(0.5)
        result.words_count = 2
      end

      it { is_expected.to eq(0.25) }
    end
  end

  describe "<=>" do
    let(:first_result) { described_class.new(language_code: :de) }
    let(:second_result) { described_class.new(language_code: :en) }
    let(:third_result) { described_class.new(language_code: :fr) }

    before do
      first_result.add(0.2)
      second_result.add(0.4)
      third_result.add(0.1)
    end

    specify { expect(first_result).to be > third_result }
    specify { expect(first_result).to be < second_result }
    specify { expect(second_result).to be > third_result }

    specify { expect(first_result <=> second_result).to eq(-1) }
    specify { expect(first_result <=> third_result).to eq(1) }
    specify { expect(second_result <=> first_result).to eq(1) }
    specify { expect(second_result <=> third_result).to eq(1) }
    specify { expect(third_result <=> first_result).to eq(-1) }
    specify { expect(third_result <=> second_result).to eq(-1) }
  end

  describe "#to_h" do
    subject { result.to_h }

    it { is_expected.to be_a(Hash) }
    it { is_expected.to include(language: :"German") }
    it { is_expected.to include(language_code: :de) }
    it { is_expected.to include(confidence: 0) }
    it { is_expected.to include(value: 0) }
    it { is_expected.to include(hit_ratio: 0) }
    it { is_expected.to include(hit_count: 0) }
    it { is_expected.to include(words_count: 0) }
  end

  # TODO: Spec properly
  describe "#to_json" do
    subject { result.to_json }
    it { is_expected.to be_a(String) }
  end
end
