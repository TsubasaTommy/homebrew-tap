class Optiman < Formula
  desc "Convert photos to JPEG XL without quality loss, using no resources while idle"
  homepage "https://tsubasatommy.github.io/optiman/"
  url "https://github.com/TsubasaTommy/optiman/releases/download/v0.5.0/optiman-macos-universal.tar.gz"
  sha256 "7bd538b123b3434d0688c1f29e61cc4cb87d21cc3a50020b165110b6aae6e7b3"
  license "MIT"

  depends_on :macos

  def install
    bin.install "optiman"
    doc.install "README.md", "THIRD_PARTY_LICENSES.txt"
  end

  def caveats
    <<~EOS
      Start converting (registers a launchd agent that runs only when a watched folder changes):
        optiman install
      Open the settings window (folders, quality and compression strength):
        optiman settings
      Before `brew uninstall`, unregister the agent:
        optiman uninstall
      macOS 14 or later can display JPEG XL in Finder, Preview and Photos.
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/optiman --version")
  end
end
