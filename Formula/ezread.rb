class Ezread < Formula
  desc "Markdown reader for macOS that opens a repository as articles"
  homepage "https://pierry.github.io/ezread/"
  url "https://github.com/Pierry/ezread/archive/refs/tags/v0.3.0.tar.gz"
  sha256 "0a18060c131ed1a3be836060bee7719f26ab7b8d360e73299535d26fbeaa50f0"
  license "MIT"

  depends_on xcode: ["15.0", :build]
  depends_on macos: :sonoma

  def install
    system "scripts/bundle.sh"
    prefix.install "build/ezread.app"
    bin.install_symlink prefix/"ezread.app/Contents/MacOS/ezread"
  end

  test do
    assert_match "path not found", shell_output("#{bin}/ezread /nonexistent-ezread-path 2>&1", 1)
  end
end
