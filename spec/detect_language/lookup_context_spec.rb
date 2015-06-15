require 'spec_helper'

describe DetectLanguage::LookupContext do
  # let(:wordlist_path) do
  #   File.absolute_path(
  #     File.join(__FILE__, '../../../wordlists/wordlist-10k.pstore')
  #   )
  # end

  let(:lookup_hash) do
    Hash.new.tap do |hash|
      hash[:locales] = ['de', 'en']
      hash["de"] = { "der" => 0.04, "die" => 0.03 }
      hash["en"] = { "the" => 0.05, "of" => 0.02 }
    end
  end

  let(:lookup_context) { described_class.new(lookup_hash) }
  subject { lookup_context }

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
    let(:wordlist_path) do
      File.join(File.dirname(__FILE__), 'wordlists', 'wordlist-10.pstore')
    end
    subject { described_class.from_wordlist_path(wordlist_path) }

    describe "returns a LookupContext" do
      specify { expect(subject).to be_kind_of(DetectLanguage::LookupContext) }

      specify "with locales set" do
        expect(subject.locales).to eq(%w(it en fr de nl))
      end
    end
  end

  describe "#locales" do
    specify { expect(subject.locales).to eq(%w(de en)) }
  end

  describe "[](word)" do
    subject { lookup_context[word] }

    context "with 'der'" do
      let(:word) { 'der' }
      specify { expect(subject).to eq({"de" => 0.04, "en" => 0.0}) }
    end

    context "with 'of'" do
      let(:word) { 'of' }
      specify { expect(subject).to eq({"de" => 0.0, "en" => 0.02}) }
    end
  end
end
