require 'spec_helper'

describe ThatLanguage::Store do
  subject(:store) { described_class.new(path) }

  let(:path) { File.join('spec', 'that_language', 'wordlists', 'wordlist-10.pstore') }

  describe "#initialize(path)" do
    context "when no path given" do
      it "raises an ArgumentError" do
        expect {
          described_class.new
        }.to raise_error(ArgumentError)
      end
    end

    context "when path given" do
      # its(:path) { is_expected.to eq('foo') }
      specify { expect(subject.path).to eq(path) }

      context "and no pstore exists" do
        let(:path) { 'path/to/nothing.pstore' }
        pending
      end
    end
  end

  describe "#to_h" do
    subject { store.to_h }

    it { is_expected.to be_kind_of(Hash) }

    it "contains :language_codes" do
      expect(subject[:language_codes]).not_to be_nil
    end

    it "contains 'de'" do
      expect(subject['de']).not_to be_nil
    end
  end

  describe "exists?" do
    subject { store.exists? }

    context "when pstore exists" do
      let(:path) { File.join('spec', 'that_language', 'wordlists', 'wordlist-10.pstore') }
      it { is_expected.to be(true) }
    end

    context "when pstore does not exists" do
      let(:path) { 'path/to/nothing.pstore' }
      it { is_expected.to be(false) }
    end
  end
end
