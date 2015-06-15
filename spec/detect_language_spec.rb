require 'spec_helper'

describe DetectLanguage do
  it 'has a version number' do
    expect(DetectLanguage::VERSION).not_to be nil
  end

  describe ".configuration" do
    subject { described_class.configuration }

    it "returns a DetectLanguage::Configuration" do
      expect(subject).to be_kind_of(DetectLanguage::Configuration)
    end

    it "memoizes the Configuration" do
      expect(subject).to eq(described_class.configuration)
    end
  end

  describe ".config" do
    it "delegates to .configuration" do
      expect(described_class.config).to eq(described_class.configuration)
    end
  end

  describe ".lookup_context" do
    subject { described_class.lookup_context }

    let(:config) { described_class.config }
    let(:wordlist_path) do
      File.join(File.dirname(__FILE__), 'detect_language', 'wordlists',
                'wordlist-10.pstore')
    end

    before do
      allow(DetectLanguage.configuration).to receive(:wordlist_path)
        .and_return(wordlist_path)
    end

    it "returns a DetectLanguage::LookupContext" do
      expect(subject).to be_kind_of(DetectLanguage::LookupContext)
    end

    it "memoizes the LookupContext" do
      expect(subject).to eq(described_class.lookup_context)
    end

    it "create a LookupContext with with locales set" do
      expect(subject.locales).to eq(%w(it en fr de nl))
    end
  end
end
