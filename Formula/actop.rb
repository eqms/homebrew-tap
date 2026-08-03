class Actop < Formula
  desc "Top-like terminal UI for Apple containers (like ctop)"
  homepage "https://github.com/eqms/actop"
  url "https://github.com/eqms/actop/archive/refs/tags/v0.6.1.tar.gz"
  sha256 "b023a6f04486c0cd1e3cc457481c2092305f4fd19ae4009ee80b19614c7f2340"
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
