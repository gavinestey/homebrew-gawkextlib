class Gawkextlib < Formula
  desc "Base library for Gawk extension API additions"
  homepage "https://gawkextlib.sourceforge.io/"
  url "https://downloads.sourceforge.net/project/gawkextlib/gawkextlib-1.0.4.tar.gz"
  sha256 "ecd06c1857f58530f73866dffb74a32f17d1194c045f351b5ab8acad4f77678c"

  depends_on "autoconf" => :build
  depends_on "automake" => :build
  depends_on "libtool" => :build
  depends_on "gawk"

  def install
    system "autoreconf", "-i"
    system "./configure", "--disable-dependency-tracking", "--disable-silent-rules",
                          "--prefix=#{prefix}"
    system "make", "install"
  end

  test do
    system "false"
  end
end
