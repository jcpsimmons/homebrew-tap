class Eponysay < Formula
  desc "Pony-themed cowsay (enhanced fork)"
  homepage "https://github.com/jcpsimmons/eponysay"
  url "https://github.com/jcpsimmons/eponysay/archive/refs/heads/master.zip"
  sha256 "d4794c9f3eeaf202a3d0d1530c41bf22c12d79091a3ce722988b1972ced7f3bb"
  version "3.0.3"
  
  def install
    # Install to a temporary location first
    system "python3", "setup.py", "--prefix=#{buildpath}/temp", "--freedom=partial", "--without-info", "--without-pdf", "--without-shared-cache", "install"
    
    # Copy and rename the main executable
    bin.install "#{buildpath}/temp/bin/ponysay" => "eponysay"
    
    # Create symlinks for other commands
    bin.install_symlink "eponysay" => "eponythink"  
    bin.install_symlink "eponysay" => "eponysay-tool"
    
    # Install data files
    share.install Dir["#{buildpath}/temp/share/ponysay"]
    man6.install Dir["#{buildpath}/temp/share/man/man6/*"]
    
    # Install shell completions
    bash_completion.install "#{buildpath}/temp/share/bash-completion/completions/ponysay" => "eponysay"
    fish_completion.install "#{buildpath}/temp/share/fish/vendor_completions.d/ponysay.fish" => "eponysay.fish"
    zsh_completion.install "#{buildpath}/temp/share/zsh/site-functions/_ponysay" => "_eponysay"
  end
  
  test do
    system "#{bin}/eponysay", "Test"
  end
end