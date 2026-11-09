class Zread < Formula
  desc "Markdown reader for macOS that opens a repository as articles"
  homepage "https://pierry.github.io/zread/"
  url "https://github.com/Pierry/zread/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "8a6b67cb3cf78f49ac1a901348500e4d5c7866a296bb762421759d8277682dcb"
  license "MIT"

  depends_on xcode: ["15.0", :build]
  depends_on macos: :sonoma

  def install
    system "scripts/bundle.sh"
    prefix.install "build/zread.app"
    bin.install_symlink prefix/"zread.app/Contents/MacOS/zread"
  end

  test do
    assert_match "caminho", shell_output("#{bin}/zread /nonexistent-zread-path 2>&1", 1)
  end
end
