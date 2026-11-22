class Optiman < Formula
  desc "Convert photos to JPEG XL without quality loss, using no resources while idle"
  homepage "https://tsubasatommy.github.io/optiman/"
  url "https://github.com/TsubasaTommy/optiman/releases/download/v0.3.0/optiman-macos-universal.tar.gz"
  sha256 "5f4665f3a4de8a69715f09f249aac80a076f53b2e5fb7fd0004d721cbc31f47e"
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
      Coming from optimize-image-folder (the former name)? Run `optiman install` once: it takes
      over the settings and replaces the old agent.
      Open the settings window (folders and compression strength):
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
