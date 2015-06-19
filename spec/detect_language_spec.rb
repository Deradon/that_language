require 'spec_helper'

describe DetectLanguage do
  let(:wordlist_path) do
    File.join(File.dirname(__FILE__), 'detect_language', 'wordlists',
              'wordlist-10.pstore')
  end

  before do
    allow(DetectLanguage.configuration).to receive(:wordlist_path)
      .and_return(wordlist_path)
  end

  it 'has a version number' do
    expect(DetectLanguage::VERSION).not_to be nil
  end

  describe ".configuration" do
    subject { described_class.configuration }

    it { is_expected.to be_kind_of(DetectLanguage::Configuration) }
    it "memoizes the Configuration" do
      expect(subject).to eq(described_class.configuration)
    end
  end

  describe ".config" do
    subject { described_class.config }

    it { is_expected.to be_kind_of(DetectLanguage::Configuration) }
    it "memoizes the Configuration" do
      expect(subject).to eq(described_class.config)
    end

    it "delegates to .configuration" do
      expect(described_class.config).to eq(described_class.configuration)
    end
  end

  describe ".lookup_context" do
    subject { described_class.lookup_context }

    it { is_expected.to be_kind_of(DetectLanguage::LookupContext) }
    it "memoizes the LookupContext" do
      expect(subject).to eq(described_class.lookup_context)
    end

    it "create a LookupContext with with locales set" do
      expect(subject.locales).to eq(%w(it en fr de nl))
    end
  end

  describe ".detect" do
    subject { described_class.detect }

    it { is_expected.to be_kind_of(DetectLanguage::Detect) }
    it "memoizes the Detect" do
      expect(subject).to eq(described_class.detect)
    end
  end

  describe ".language(text)" do
    subject { described_class.language(text) }
    let(:text) { "der the of" }

    it "returns a language" do
      expect(subject).to eq("en")
    end
  end
end
