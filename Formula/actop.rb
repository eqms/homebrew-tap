class Actop < Formula
  desc "Top-like terminal UI for Apple containers (like ctop)"
  homepage "https://github.com/eqms/actop"
  url "https://github.com/eqms/actop/archive/refs/tags/v0.4.0.tar.gz"
  sha256 "f7e3af1b7161e44bed26599158ad14d2323c9c37468dd84a9b24048a92e03563"
  license "MIT"
  head "https://github.com/eqms/actop.git", branch: "main"

  depends_on "go" => :build
  depends_on :macos

  def install
    ldflags = "-w -X main.version=#{version} -X main.build=homebrew"
    system "go", "build", *std_go_args(ldflags: ldflags)
  end

  test do
    assert_match "actop version #{version}", shell_output("#{bin}/actop -v")
  end
end
