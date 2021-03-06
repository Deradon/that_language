require 'spec_helper'

describe ThatLanguage::Detect do
  subject(:detect) { described_class.new(lookup_context) }

  let(:lookup_context) { ThatLanguage::LookupContext.new(lookup_hash) }
  let(:lookup_hash) do
    Hash.new.tap do |hash|
      hash[:language_codes] = %w(de en es)
      hash["de"] = { "der" => 0.04, "die" => 0.03 }
      hash["en"] = { "the" => 0.05, "of" => 0.02 }
      hash["es"] = { "gusta" => 0.05 }
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

  describe "#language(text)" do
    subject { detect.language(text) }
    it { is_expected.to eq(:"English") }

    context "with empty string" do
      let(:text) { "" }
      it { is_expected.to eq(nil) }
    end
  end

  describe "#language_code(text)" do
    subject { detect.language_code(text) }
    it { is_expected.to eq("en") }

    context "with empty string" do
      let(:text) { "" }
      it { is_expected.to eq(nil) }
    end
  end

  describe "#detect(text)" do
    subject { detect.detect(text) }

    it { is_expected.to be_kind_of(ThatLanguage::Result) }

    its(:language) { is_expected.to eq(:English) }
    its(:language_code) { is_expected.to eq("en") }

    its(:confidence) { is_expected.to be > 0.6 }
    its(:confidence) { is_expected.not_to be > 0.7 }

    its(:hit_ratio) { is_expected.to be > 0.6 }
    its(:hit_ratio) { is_expected.not_to be > 0.7 }

    its(:hit_count) { is_expected.to eq(2) }

    context "when text is empty string" do
      let(:text) { "" }
      it { is_expected.to be_kind_of(ThatLanguage::Result) }

      its(:language) { is_expected.to eq(nil) }
      its(:language_code) { is_expected.to eq(nil) }
      its(:confidence) { is_expected.to eq(0) }
    end
  end

  describe "#details(text)" do
    subject(:details) { detect.details(text) }

    it { is_expected.to be_kind_of(ThatLanguage::ResultSet) }

    it "does not contain Results with 0 confidence" do
      details.results.each do |result|
        expect(result.confidence).to be > 0
      end
    end
  end

  describe "#to_h" do
    pending
  end
end
