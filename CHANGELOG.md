## 0.2.0 [☰](https://github.com/Deradon/that_language/compare/v0.1.2...v0.2.0) (2026-07-20)

Revival release. 0.1.2 dates from 2015 and does not run on Ruby 3 or later.

### Breaking changes

* `required_ruby_version` is now `>= 3.1`. The gem no longer installs on Ruby
  2.x — hence the minor bump rather than a patch. Bundler continues to resolve
  0.1.2 for projects still on 2.x.

### Bug fixes

* `File.exists?` → `File.exist?`. The alias was removed in Ruby 3, and this was
  the single runtime blocker: the first wordlist load raised `NoMethodError`.
* `Store#within_pstore` now opens a **read-only** transaction
  (`pstore.transaction(true)`). PStore's default is read-write and commits on
  block exit, so every wordlist load rewrote the `.pstore` file it read.

### Enhancements

* `pstore` is declared as a runtime dependency. It stopped being a default gem
  in Ruby 4.0, where its absence is a bare `LoadError` at require time.
* Gemspec: dropped the `bundler ~> 1.10` development dependency that made
  `bundle install` unsolvable, bumped rake, and added a description and
  metadata.
* RuboCop 1.88 with a generated `.rubocop_todo.yml`, so the revival is not
  buried in a mass reformatting.
* CI moved from Travis to GitHub Actions, covering Ruby 3.1 through 4.0.

The 2015 PStore wordlists are unchanged and load correctly on 3.2, 3.3 and 4.0.

## 0.1.2 [☰](https://github.com/Deradon/that_language/compare/v0.1.1...v0.1.2) (2015-12-07)

## 0.1.1 [☰](https://github.com/Deradon/that_language/compare/v0.1.0...v0.1.1) (2015-12-07)

## 0.1.0 (2015-12-07)

* Initial release
