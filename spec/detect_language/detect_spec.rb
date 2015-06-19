require 'spec_helper'

describe DetectLanguage::Detect do
  subject { detect }

  let(:detect) { described_class.new(lookup_context) }
  let(:lookup_context) { DetectLanguage::LookupContext.new(lookup_hash)}
  let(:lookup_hash) do
    Hash.new.tap do |hash|
      hash[:locales] = ['de', 'en']
      hash["de"] = { "der" => 0.04, "die" => 0.03 }
      hash["en"] = { "the" => 0.05, "of" => 0.02 }
    end
  end

  describe ".initialize" do
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
    let(:text) { "der the of" }
    subject { detect.details(text) }

    it "returns a detailed hash" do
      expect(subject).to eq({"de" => 0.04, "en" => 0.07})
    end
  end

  describe "#language(text)" do
    let(:text) { "der the of" }
    subject { detect.language(text) }

    it "returns a language" do
      expect(subject).to eq("en")
    end
  end
end
