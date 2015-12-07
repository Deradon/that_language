require 'spec_helper'

describe ThatLanguage::Configuration do
  subject(:configuration) { described_class.new }

  let(:expected_wordlist_path) do
    File.absolute_path(File.join(__FILE__, '../../../wordlists/10k'))
  end

  it { is_expected.to be_kind_of(described_class) }
  its(:wordlist_path) { is_expected.to eq(expected_wordlist_path) }

  describe "#wordlist_path=" do
    before { configuration.wordlist_path = "wordlists/100k" }
    after { configuration.wordlist_path = expected_wordlist_path }

    its(:wordlist_path) { is_expected.to eq("wordlists/100k") }
  end
end
