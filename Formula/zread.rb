class Zread < Formula
  desc "Markdown reader for macOS that opens a repository as articles"
  homepage "https://pierry.github.io/zread/"
  url "https://github.com/Pierry/zread/archive/refs/tags/v0.1.2.tar.gz"
  sha256 "d9783b1ae520a833d897916faa07fe1aa9cddcd7876af3613d4972c21a043dc9"
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
