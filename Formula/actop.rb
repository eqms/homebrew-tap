class Actop < Formula
  desc "Top-like terminal UI for Apple containers (like ctop)"
  homepage "https://github.com/eqms/actop"
  url "https://github.com/eqms/actop/archive/refs/tags/v0.5.0.tar.gz"
  sha256 "8f3e2da484810757c740c24b2ccdac2e21c96091cd66c4c55ec1a52e4af1eb08"
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
