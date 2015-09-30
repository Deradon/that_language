module AvailableLanguagesHelper
  def self.included(base)
    base.send :extend, ClassMethods
  end

  module ClassMethods
    def use_language_code(language_code)
      let(:language_code) { language_code}
      its(:available_language_codes) { is_expected.to include(language_code) }
    end

    def assert_that_language_with(text)
      subject(:that_language) { described_class }

      describe ".language_code('#{text}')" do
        subject { that_language.language_code(text) }
        it { is_expected.to eq(language_code) }
      end
    end
  end
end
