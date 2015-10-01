require 'spec_helper'

describe ThatLanguage do
  let(:wordlist_path) do
    File.join(
      File.dirname(__FILE__),
      'that_language',
      'wordlists',
      'wordlist-10.pstore'
    )
  end
  let(:text) { "der the of" }

  before do
    allow(ThatLanguage.configuration).to receive(:wordlist_path)
      .and_return(wordlist_path)
  end

  it 'has a version number' do
    expect(ThatLanguage::VERSION).not_to be nil
  end

  describe ".configuration" do
    subject { described_class.configuration }

    it { is_expected.to be_kind_of(ThatLanguage::Configuration) }
    it "memoizes the Configuration" do
      expect(subject).to eq(described_class.configuration)
    end
  end

  describe ".config" do
    subject { described_class.config }

    it "delegates to .configuration" do
      expect(described_class.config).to eq(described_class.configuration)
    end
  end

  describe ".language_code(text)" do
    subject { described_class.language_code(text) }
    it { is_expected.to eq("en") }
  end

  describe ".detect(text)" do
    subject { described_class.detect(text) }
    it { is_expected.to be_kind_of(ThatLanguage::Result) }
  end

  describe ".details(text)" do
    subject { described_class.details(text) }
    it { is_expected.to be_kind_of(ThatLanguage::ResultSet) }
  end

  describe ".available_language_codes" do
    subject { described_class.available_language_codes }

    it { is_expected.to include("de") }
    it { is_expected.to include("en") }
    it { is_expected.to include("fr") }
    it { is_expected.to include("it") }
    it { is_expected.to include("nl") }
  end

  describe ".monkeypatch(klass)" do
    subject { klass.new(text) }
    let(:klass) { Class.new(String) }

    before { described_class.monkeypatch(klass) }

    its(:language_code) { is_expected.to eq("en") }
  end
end
