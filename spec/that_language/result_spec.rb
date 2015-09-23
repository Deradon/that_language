require 'spec_helper'

describe ThatLanguage::Result do
  subject(:result) { described_class.new(locale: locale) }

  let(:locale) { :de }

  describe ".initialize" do
    context "without locale" do
      it "raises an ArgumentError" do
        expect { described_class.new }.to raise_error(ArgumentError)
      end
    end
  end

  its(:locale) { is_expected.to eq(:de) }
  its(:value) { is_expected.to eq(0) }
  its(:hit_count) { is_expected.to eq(0) }
  its(:words_count) { is_expected.to eq(0) }
  its(:hit_count) { is_expected.to eq(0) }

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

  describe "#total_value=" do
    before { subject.total_value = 0.7 }
    its(:total_value) { is_expected.to eq(0.7) }
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

  describe "#percentage" do
    subject { result.percentage }

    before do
      result.add(0.5)
      result.total_value = 0.7
    end

    it { is_expected.to eq(0.5/0.7) }

    context "when total_value is 0" do
      before { result.total_value = 0 }
      it { is_expected.to eq(0) }
    end
  end

  describe "#score" do
    subject { result.score }

    before do
      result.add(0.2)
      result.words_count = 2
      result.total_value = 0.4
    end

    it { is_expected.to eq(0.2/0.4 * 1/2) }

    context "when total_value is 0" do
      before { result.total_value = 0 }
      it { is_expected.to eq(0) }
    end

    context "when words_count is 0" do
      before { result.words_count = 0 }
      it { is_expected.to eq(0) }
    end
  end

  describe "<=>" do
    let(:first_result) { described_class.new(locale: :de) }
    let(:second_result) { described_class.new(locale: :en) }
    let(:third_result) { described_class.new(locale: :fr) }

    before do
      first_result.add(0.2)
      second_result.add(0.4)
      third_result.add(0.1)

      [first_result, second_result, third_result].each do |result|
        result.total_value = 0.7
        result.words_count = 10
      end
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
    it { is_expected.to include(locale: locale) }
    it { is_expected.to include(value: 0) }
    it { is_expected.to include(score: 0) }
    it { is_expected.to include(percentage: 0) }
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
