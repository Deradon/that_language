require 'spec_helper'

describe ThatLanguage::Configuration do
  subject(:configuration) { described_class.new }

  describe "#initialize" do
    it { is_expected.to be_kind_of(described_class) }
  end

  describe "default configuration" do
    describe "#wordlist_path" do
      subject { configuration.wordlist_path }
      let(:wordlist_path) do
        File.absolute_path(File.join(__FILE__, '../../../wordlists/10000'))
      end

      it { is_expected.to eq(wordlist_path) }
    end
  end
end
