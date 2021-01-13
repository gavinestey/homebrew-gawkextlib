class GawkextlibCsv < Formula
  desc "Extends gawk with CSV support"
  homepage "https://gawkextlib.sourceforge.io/csv/csv.html"
  url "https://downloads.sourceforge.net/project/gawkextlib/snapshot/gawk-csv-snapshot.tar.gz"
  version "1.0.0"
  sha256 "c6120d267d678b144a3e4272d167a0cba6e535a2c72dea7b22aa23da4aac3758"

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
