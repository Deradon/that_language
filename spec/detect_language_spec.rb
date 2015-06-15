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

    it "memoizes the configuration" do
      expect(subject).to eq(described_class.configuration)
    end
  end

  describe ".config" do
    it "delegates to .configuration" do
      expect(described_class.config).to eq(described_class.configuration)
    end
  end
end
