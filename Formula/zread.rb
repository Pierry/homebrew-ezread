class Zread < Formula
  desc "Markdown reader for macOS that opens a repository as articles"
  homepage "https://pierry.github.io/zread/"
  url "https://github.com/Pierry/zread/archive/refs/tags/v0.2.1.tar.gz"
  sha256 "257b1f2922d2a78a76f7d419656c22446c4433756ab35778661c0eac00ff3952"
  license "MIT"

  depends_on xcode: ["15.0", :build]
  depends_on macos: :sonoma

  def install
    system "scripts/bundle.sh"
    prefix.install "build/zread.app"
    bin.install_symlink prefix/"zread.app/Contents/MacOS/zread"
  end

  test do
    assert_match "path not found", shell_output("#{bin}/zread /nonexistent-zread-path 2>&1", 1)
  end
end
