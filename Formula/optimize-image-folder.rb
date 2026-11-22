class OptimizeImageFolder < Formula
  desc "Convert photos to JPEG XL without quality loss, using no resources while idle"
  homepage "https://tsubasatommy.github.io/optimize-image-folder/"
  url "https://github.com/TsubasaTommy/optimize-image-folder/releases/download/v0.2.0/optimize-image-folder-macos-universal.tar.gz"
  sha256 "27fa3c1694d2323943dbc7129718e7af1b12187e01d86361ee2e7f036266eaca"
  license "MIT"

  depends_on :macos

  def install
    bin.install "optimize-image-folder"
    doc.install "README.md", "THIRD_PARTY_LICENSES.txt"
  end

  def caveats
    <<~EOS
      Start converting (registers a launchd agent that runs only when a watched folder changes):
        optimize-image-folder install
      Open the settings window (folders and compression strength):
        optimize-image-folder settings
      Before `brew uninstall`, unregister the agent:
        optimize-image-folder uninstall
      macOS 14 or later can display JPEG XL in Finder, Preview and Photos.
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/optimize-image-folder --version")
  end
end
