class PonysayRust < Formula
  desc "Native Rust pony-themed terminal art with bundled ponies and quotes"
  homepage "https://github.com/jcpsimmons/ponysay-rust"
  url "https://github.com/jcpsimmons/ponysay-rust/archive/refs/tags/v4.0.0.tar.gz"
  sha256 "621b8f5ad632f0ffa9d279ca043cccd2eb1b68f38e88780d550bfe0524f32456"
  license "GPL-3.0-or-later"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args(root: libexec)
    bin.install_symlink libexec/"bin/ponysay" => "ponysay-rust"
    bin.install_symlink libexec/"bin/ponysay" => "ponythink-rust"
    (libexec/"bin").install_symlink "ponysay" => "ponythink"
  end

  def caveats
    <<~EOS
      The commands ponysay-rust and ponythink-rust are on your PATH.
      To use this version as ponysay and ponythink, add its aliases first:
        export PATH="#{opt_libexec}/bin:$PATH"
    EOS
  end

  test do
    assert_match "ponysay-rust #{version} (Rust)", shell_output("#{bin}/ponysay-rust --version")

    message = '\- $HOME'
    output = shell_output("#{bin}/ponysay-rust -f twilight --no-color '#{message}' 2>stderr")
    assert_match message, output
    refute_match "\e[", output
    assert_empty (testpath/"stderr").read

    thought = shell_output("#{bin}/ponythink-rust -f twilight --no-color thinking 2>stderr")
    assert_match "( thinking", thought
    refute_match "< thinking", thought
    assert_empty (testpath/"stderr").read

    assert_match message, shell_output("#{libexec}/bin/ponysay -f twilight --no-color '#{message}'")
    assert_match "( thinking", shell_output("#{libexec}/bin/ponythink -f twilight --no-color thinking")
  end
end
