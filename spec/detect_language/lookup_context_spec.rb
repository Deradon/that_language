require 'spec_helper'

describe DetectLanguage::LookupContext do
  subject(:lookup_context) { described_class.new(lookup_hash) }

  let(:lookup_hash) do
    Hash.new.tap do |hash|
      hash[:locales] = %w(de en)
      hash["de"] = { "der" => 0.04, "die" => 0.03 }
      hash["en"] = { "the" => 0.05, "of" => 0.02 }
    end
  end

  its(:locales) { is_expected.to eq(%w(de en)) }

  describe "#initialize" do
    context "without arguments" do
      it "raises an ArgumentError" do
        expect { described_class.new() }.to raise_error(ArgumentError)
      end
    end

    context "with valid lookup_hash as argument" do
      it "raises no Error" do
        expect { described_class.new(lookup_hash) }.not_to raise_error
      end
    end
  end

  describe ".from_wordlist_path(wordlist_path)" do
    subject { described_class.from_wordlist_path(wordlist_path) }

    let(:wordlist_path) do
      File.join(File.dirname(__FILE__), 'wordlists', 'wordlist-10.pstore')
    end

    it { is_expected.to be_kind_of(DetectLanguage::LookupContext) }
    its(:locales) { is_expected.to eq(%w(it en fr de nl)) }
  end

  describe "[](word)" do
    subject { lookup_context[word] }

    context "with 'der'" do
      let(:word) { 'der' }
      it { is_expected.to eq({"de" => 0.04, "en" => 0.0}) }
    end

    context "with 'of'" do
      let(:word) { 'of' }
      it { is_expected.to eq({"de" => 0.0, "en" => 0.02}) }
    end
  end
end
