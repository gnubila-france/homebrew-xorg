class LibomxilBellagio < Formula
  desc "Mesa: cross-driver middleware"
  homepage "http://dri.freedesktop.org"
  url "http://downloads.sourceforge.net/project/omxil/omxil/Bellagio%200.9.3/libomxil-bellagio-0.9.3.tar.gz"
  sha256 "593c0729c8ef8c1467b3bfefcf355ec19a46dd92e31bfc280e17d96b0934d74c"

  option "without-test", "Skip compile-time tests"
  option "with-static",   "Build static libraries (not recommended)"

  depends_on "pkg-config" => :build
  depends_on "autoconf" => :build

  def install
    args = %W[
      --prefix=#{prefix}
      --sysconfdir=#{etc}
      --localstatedir=#{var}
      --disable-dependency-tracking
    ]

    # Be explicit about the configure flags
    args << "--enable-static=#{build.with?("static") ? "yes" : "no"}"

    system "autoreconf", "-fiv"
    system "./configure", *args
    ENV.deparallelize
    system "make"
    system "make", "install"
    system "make", "check" if build.with?("test")
  end
end
