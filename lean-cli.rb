class LeanCli < Formula
  desc "Command line tool to develop and manage LeanCloud apps."
  homepage "https://leancloud.com"
  url "https://github.com/leancloud/lean-cli/archive/v0.1.1.tar.gz"
  head "https://github.com/leancloud/lean-cli.git"
  sha256 "c7b8e76945a7841b9bf795409a267addf60141079365d893810a2c171b0162be"

  depends_on "go" => :build

  def install
    build_from = build.head? ? "homebrew-head" : "homebrew"
    ENV["GOPATH"] = buildpath
    mkdir_p buildpath/"src/github.com/leancloud/"
    ln_s buildpath, buildpath/"src/github.com/leancloud/lean-cli"
    system "go", "build", "-o", "output/lean", "-ldflags", "-X main.pkgType=#{build_from}", "github.com/leancloud/lean-cli/lean"
    bin.install "output/lean"
  end

  test do
    system "true"
  end
end
