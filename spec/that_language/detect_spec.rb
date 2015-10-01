require 'spec_helper'

describe ThatLanguage::Detect do
  subject(:detect) { described_class.new(lookup_context) }

  let(:lookup_context) { ThatLanguage::LookupContext.new(lookup_hash) }
  let(:lookup_hash) do
    Hash.new.tap do |hash|
      hash[:language_codes] = %w(de en)
      hash["de"] = { "der" => 0.04, "die" => 0.03 }
      hash["en"] = { "the" => 0.05, "of" => 0.02 }
    end
  end
  let(:text) { "der the of" }

  describe "#initialize" do
    context "without arguments" do
      it "raises a ArgumentError" do
        expect{ described_class.new() }.to raise_error(ArgumentError)
      end
    end

    context "with LookupContext given" do
      it "raise no Error" do
        expect{ described_class.new(lookup_context) }.not_to raise_error
      end
    end
  end

  describe "#details(text)" do
    subject { detect.details(text) }

    it { is_expected.to be_kind_of(ThatLanguage::ResultSet) }
  end

  describe "#language_code(text)" do
    subject { detect.language_code(text) }
    it { is_expected.to eq("en") }
  end

  describe "#detect(text)" do
    subject { detect.detect(text) }

    it { is_expected.to be_kind_of(ThatLanguage::Result) }

    its(:language_code) { is_expected.to eq("en") }

    its(:confidence) { is_expected.to be > 0.6 }
    its(:confidence) { is_expected.not_to be > 0.7 }

    its(:hit_ratio) { is_expected.to be > 0.6 }
    its(:hit_ratio) { is_expected.not_to be > 0.7 }

    its(:hit_count) { is_expected.to eq(2) }
  end

  describe "#to_h" do
    pending
  end
end
