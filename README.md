# jcpsimmons Homebrew tap

Install [ponysay-rust](https://github.com/jcpsimmons/ponysay-rust), the native
Rust pony renderer with bundled artwork, quotes and balloon styles:

```sh
brew install jcpsimmons/tap/ponysay-rust
ponysay-rust -f twilight 'Hello from Rust'
ponythink-rust -f twilight 'Thinking in ponies'
ponysay-rust -f rust 'Fearless concurrency.'
ponythink-rust -f rust 'Borrow checked.'
```

Version 4.1.0 adds the bundled Rust gear logo, selected with `-f rust`.

The formula builds the tagged release with Cargo's locked dependency versions.
Rust is required only for the build. The installed program has no additional
runtime package dependencies.

To use the conventional `ponysay` and `ponythink` names, put this package's
aliases first on your PATH:

```sh
export PATH="$(brew --prefix ponysay-rust)/libexec/bin:$PATH"
```

Add that line to your shell configuration to keep it across sessions. The
namespaced commands can coexist with Homebrew's original `ponysay` package.

The older `eponysay` formula remains available unchanged. This is an independent
tap; it does not replace Homebrew's core formula.

Maintainers can check this package with:

```sh
brew style --formula jcpsimmons/tap/ponysay-rust
brew install --build-from-source jcpsimmons/tap/ponysay-rust
brew test jcpsimmons/tap/ponysay-rust
brew audit --strict jcpsimmons/tap/ponysay-rust
```

The workflow tests only `ponysay-rust` on macOS and Linux. Formula files stay
at the repository root so the existing `eponysay.rb` remains discoverable.
