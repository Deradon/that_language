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

  describe ".locale(text)" do
    subject { described_class.locale(text) }
    let(:text) { "der the of" }

    it { is_expected.to be_kind_of(ThatLanguage::Result) }
    it "returns a Result with a locale" do
      expect(subject.locale).to eq("en")
    end
  end

  describe ".details(text)" do
    subject { described_class.details(text) }
    let(:text) { "der the of" }

    it { is_expected.to be_kind_of(ThatLanguage::ResultSet) }
  end

  describe ".available_locales" do
    subject { described_class.available_locales }

    it { is_expected.to include("de") }
    it { is_expected.to include("en") }
    it { is_expected.to include("fr") }
    it { is_expected.to include("it") }
    it { is_expected.to include("nl") }
  end

  describe ".monkeypatch(klass)" do
    let(:klass) { Class.new(String) }
    let(:text) { "der the of" }

    before { described_class.monkeypatch(klass) }

    specify "monkeypatched class responds to :locale" do
      expect(klass.instance_methods).to include(:locale)
    end

    describe "<MonkeypatchedClass>#locale(text)" do
      subject { klass.new(text) }
      it "returns a Result with a locale" do
        expect(subject.locale.locale).to eq("en")
      end
    end
  end

  describe ".detect" do
    subject { described_class.detect }

    it { is_expected.to be_kind_of(ThatLanguage::Detect) }
    it "memoizes the Detect" do
      expect(subject).to eq(described_class.detect)
    end
  end

  describe ".lookup_context" do
    subject { described_class.lookup_context }

    it { is_expected.to be_kind_of(ThatLanguage::LookupContext) }
    it "memoizes the LookupContext" do
      expect(subject).to eq(described_class.lookup_context)
    end

    it "create a LookupContext with with locales set" do
      expect(subject.locales).to eq(%w(it en fr de nl))
    end
  end
end
