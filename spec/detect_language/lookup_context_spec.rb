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

    context "when given path is a existing file" do
      let(:wordlist_path) do
        File.join(File.dirname(__FILE__), 'wordlists', 'wordlist-10.pstore')
      end

      it { is_expected.to be_kind_of(DetectLanguage::LookupContext) }
      its(:locales) { is_expected.to eq(%w(it en fr de nl)) }
    end

    context "when given path is a existing directory" do
      let(:wordlist_path) do
        File.join(File.dirname(__FILE__), 'wordlists', '10')
      end

      it { is_expected.to be_kind_of(DetectLanguage::LookupContext) }
      its(:locales) { is_expected.to eq(%w(it en fr de nl)) }
    end
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

  describe "#merge(other_lookup_context)" do
    subject { lookup_context.merge(other_lookup_context) }
    let(:other_lookup_context) { described_class.new(other_lookup_hash) }
    let(:other_lookup_hash) do
      Hash.new.tap do |hash|
        hash[:locales] = %w(it)
        hash["it"] = { "foo" => 0.05, "bar" => 0.02 }
      end
    end

    its(:locales) { is_expected.to eq(%w(de en it)) }
    specify { expect(subject["der"]).to eq({"de" => 0.04, "en" => 0.0, "it" => 0.0}) }
    specify { expect(subject["of"]).to eq({"de" => 0.0, "en" => 0.02, "it" => 0.0}) }
    specify { expect(subject["foo"]).to eq({"de" => 0.0, "en" => 0.0, "it" => 0.05}) }
  end
end
