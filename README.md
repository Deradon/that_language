# ThatLanguage

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'that_language'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install that_language

## Examples

```ruby
text = "This is just a random english sentence."

## == Language

  ThatLanguage.language(text)
  # => :English


## == LanguageCode

  ThatLanguage.language_code(text)
  # => "en"


## == Detect

  detect = ThatLanguage.detect(text)
  # => #<ThatLanguage::Result:...

  # detect.language (not yet implemented)
  # => "English"

  detect.language_code
  # => "en"

  detect.confidence
  # => 0.5631093821386951

  detect.to_h
  # =>
  # {
  #   language: :English,
  #   language_code: "en",
  #   confidence: 0.5631093821386951,
  #   value: 3.9417656749708656,
  #   hit_ratio: 0.8571428571428571,
  #   hit_count: 6,
  #   words_count: 7
  # }


## == Details

  details = ThatLanguage.details(text)
  # => #<ThatLanguage::ResultSet:...

  winner = details.winner
  # => #<ThatLanguage::Result:...

  results = details.results
  # => [#<ThatLanguage::Result, #<ThatLanguage::Result, ...]

  details.to_h
  # =>
  # {
  #   "results" => [
  #     {
  #       language: :English,
  #       language_code: "en",
  #       confidence: 0.5631093821386951,
  #       value: 3.9417656749708656,
  #       hit_ratio: 0.8571428571428571,
  #       hit_count: 6,
  #       words_count: 7
  #     },
  #     {
  #       language: :Hungarian,
  #       language_code: "hu",
  #       confidence: 0.21380816083786156,
  #       value: 1.496657125865031,
  #       hit_ratio: 0.42857142857142855,
  #       hit_count: 3,
  #       words_count: 7
  #     },
  #     # ...
  #   ]
  # }
```

## Supported locales

```ruby
require 'pp'

pp ThatLanguage.available

{
  ak: :Akan,
  am: :Amharic,
  ar: :Arabic,
  as: :Assamese,
  az: :Azerbaijani,
  be: :Belarusian,
  bn: :Bengali,
  cs: :Czech,
  da: :Danish,
  de: :German,
  el: :Greek,
  en: :English,
  es: :Spanish,
  fa: :Persian,
  ff: :Fula,
  fi: :Finnish,
  fr: :French,
  gu: :Gujarati,
  ha: :Hausa,
  he: :Hebrew,
  hi: :Hindi,
  ht: :Haitian,
  hu: :Hungarian,
  it: :Italian,
  ja: :Japanese,
  jv: :Javanese,
  kk: :Kazakh,
  km: :Khmer,
  kn: :Kannada,
  ko: :Korean,
  ku: :Kurdish,
  mg: :Malagasy,
  mr: :Marathi,
  ms: :Malay,
  my: :Burmese,
  ne: :Nepali,
  nl: :Dutch,
  nn: :"Norwegian Nynorsk",
  no: :Norwegian,
  ny: :Chichewa,
  om: :Oromo,
  or: :Oriya,
  pa: :Panjabi,
  pl: :Polish,
  ps: :Pashto,
  pt: :Portuguese,
  qu: :Quechua,
  rn: :Kirundi,
  ro: :Romanian,
  ru: :Russian,
  rw: :Kinyarwanda,
  sd: :Sindhi,
  si: :Sinhala,
  sn: :Shona,
  so: :Somali,
  su: :Sundanese,
  sv: :Swedish,
  ta: :Tamil,
  te: :Telugu,
  th: :Thai,
  tk: :Turkmen,
  tl: :Tagalog,
  tr: :Turkish,
  ug: :Uyghur,
  uk: :Ukrainian,
  ur: :Urdu,
  uz: :Uzbek,
  vi: :Vietnamese,
  xh: :Xhosa,
  yo: :Yoruba,
  zh: :Chinese,
  zu: :Zulu
}

```

## Configure

To use a custom directory that contains all the wordlists:

```ruby
ThatLanguage.configure do |config|
  config.wordlist_path = File.join("wordlists", "100k")
end
```

## Development

After checking out the repo, run `bin/setup` to install dependencies.
Then, run `rake rspec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`.
To release a new version, update the version number in `version.rb`,
and then run `bundle exec rake release`, which will create a git tag for the version,
push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/Deradon/that_language.
This project is intended to be a safe, welcoming space for collaboration,
and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

