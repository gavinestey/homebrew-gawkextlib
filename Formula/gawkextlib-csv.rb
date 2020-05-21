class GawkextlibCsv < Formula
  desc "Extends gawk with CSV support"
  homepage "https://gawkextlib.sourceforge.io/csv/csv.html"
  url "https://downloads.sourceforge.net/code-snapshots/git/g/ga/gawkextlib/code.git/gawkextlib-code-9ec2589edd164e18aba27cb854f22a0bca62763f.zip"
  version "2018-04-10"
  sha256 "33dccfbf75f6d86690f23d73e431d9f4fb342b758c374d259476cc1a68b986ee"

  depends_on "autoconf" => :build
  depends_on "automake" => :build
  depends_on "libtool" => :build
  depends_on "gawk"
  depends_on "gawkextlib"

  def install
    cd "csv" do
      system "autoreconf", "-i"
      system "./configure", "--disable-dependency-tracking", "--prefix=#{prefix}"
      system "make"
      system "make", "check"
      system "make", "install"
      ohai "Need to add #{lib}/gawk to \$AWKLIBPATH"
    end
  end

  test do
    assert_equal "1",
      shell_output("echo '1,2,3' | gawk -l #{lib}/gawk/csv 'BEGIN { CSVMODE=1 } { print $1 }")
  end
end
