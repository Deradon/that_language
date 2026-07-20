# CLAUDE.md — that_language

The core detection library. Scores text against per-language word-frequency
lists stored as PStore files. Developed on Ruby 4.0.6 (`.tool-versions`);
supports 3.1 and up.

`pstore` stopped being a default gem in Ruby 4.0 and is declared as a runtime
dependency in the gemspec. Do not remove it — without it the library fails to
load on 4.x with a bare `LoadError`.

## Commands

```sh
bundle install
bundle exec rspec       # 413 examples, 0 failures, 5 pending
bundle exec rubocop
bundle exec rake spec   # same as rspec
```

The 5 pendings are pre-existing and marked "not yet implemented": Chinese and
Japanese detection (both are written without spaces, so the `/(\p{Word}+)/` word
splitter cannot segment them) plus three unwritten unit specs. A green run has
5 pending — that is expected, not a regression.

## Hard constraints

**Never modify, regenerate, move or re-encode a `.pstore` file** in `wordlists/`.
The generator that produced them is lost; they are irreplaceable source data.

**Wordlists must be opened in a read-only transaction:**

```ruby
pstore.transaction(true) { ... }   # correct
pstore.transaction { ... }         # rewrites the file on block exit
```

This is load-bearing, not stylistic. Until 2026-07-20 `Store#within_pstore` used
the default, so a single `ThatLanguage.language(...)` call left 29 wordlist files
modified in the working tree. If `git status` shows dirty `.pstore` files after
running code, something reintroduced this.

**The public API is a three-repository contract.** `that_language-client` mirrors
`ThatLanguage`'s methods over HTTP and `that_language-service` exposes the same
surface as eight endpoints. Nothing tests the parity. Renaming a public method is
a change in three repos.

## Conventions

- Two-space indent, double-quoted strings in `require`s. Some classes put
  `private`/`protected` at column 0 — that is intentional, leave it.
- **Do not mass-autocorrect RuboCop.** `.rubocop_todo.yml` grandfathers ~1750
  pre-existing offences by design. If a cop fires on new code, fix that code;
  if the todo needs regenerating, use `rubocop --auto-gen-config`.
- The 72 per-language specs in `spec/that_language/available_languages/` follow
  one shape driven by `spec/support/available_languages_helper.rb`. Keep the
  structure — one file per language.

## Gotchas

- `Store#to_h` reads a root key named `:locales` for what are now called language
  codes. There is a `FIXME`. Renaming it means rewriting every `.pstore`, which
  is forbidden above.
- `LookupContext.from_directory` loads **every** file in the wordlist directory
  with no extension filter, so any stray file becomes a phantom language. The
  shipped 72-file set is clean; the wider archive is not.
- Wordlists load lazily and memoise at module level (~0.9 s cold). Deployments
  should warm the cache at boot rather than making the first request pay.
- Default `wordlist_path` resolves from `__FILE__`, so the gem works unconfigured
  and is insensitive to the working directory.

## Context

This is a public GitHub repository — do not push without asking.
