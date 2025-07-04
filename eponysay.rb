class Eponysay < Formula
  desc "Pony-themed cowsay (enhanced fork)"
  homepage "https://github.com/jcpsimmons/eponysay"
  url "https://github.com/jcpsimmons/eponysay/archive/refs/heads/master.zip"
  sha256 "d4794c9f3eeaf202a3d0d1530c41bf22c12d79091a3ce722988b1972ced7f3bb"
  version "3.0.3"
  
  def install
    system "python3", "setup.py", "--prefix=#{prefix}", "--freedom=partial", "--without-info", "--without-pdf", "--without-shared-cache", "install"
  end
  
  test do
    system "#{bin}/ponysay", "Test"
  end
end