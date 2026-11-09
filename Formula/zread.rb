class Zread < Formula
  desc "Markdown reader for macOS that opens a repository as articles"
  homepage "https://pierry.github.io/zread/"
  url "https://github.com/Pierry/zread/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "6da2d345ea856ca0d4352ce13591962080e4c59c31069f24e5ca254866878a07"
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
