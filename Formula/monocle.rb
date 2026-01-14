class Monocle < Formula
  desc "Read-only Swift code inspection tool built on SourceKit-LSP"
  homepage "https://github.com/SwiftedMind/monocle"
  url "https://github.com/SwiftedMind/monocle.git", branch: "main", tag: "1.5.0", revision: "dc68ad4444c79f7cc256bd0168c4583625871f70"
  head "https://github.com/SwiftedMind/monocle.git", branch: "main"
  license "MIT"

  depends_on xcode: "26.0"

  def install
    system "swift", "build", "--disable-sandbox", "-c", "release"
    binary_path = Dir[".build/*/release/monocle", ".build/release/monocle"].first
    odie "monocle build artifact not found" if binary_path.nil?
    bin.install binary_path
  end

  def install
    File.open("Sources/MonocleCore/Version.generated.swift", "w") do |f|
      f.write("package let toolVersion = \"#{version}\"")
    end

    system "swift", "build", "--disable-sandbox", "-c", "release"
    
    binary_path = Dir[".build/*/release/monocle", ".build/release/monocle"].first
    odie "monocle build artifact not found" if binary_path.nil?
    bin.install binary_path
  end

  test do
    output = shell_output("#{bin}/monocle version")
    assert_match "monocle #{version}", output
  end
end
