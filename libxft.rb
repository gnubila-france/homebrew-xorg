class Libxft < Formula
  desc "Xorg Libraries: libXft"
  homepage "http://www.x.org/" ### http://www.linuxfromscratch.org/blfs/view/svn/x/x7lib.html
  url    "http://ftp.x.org/pub/individual/lib/libXft-2.3.2.tar.bz2"
  sha256 "f5a3c824761df351ca91827ac221090943ef28b248573486050de89f4bfcdc4c"
  # tag "linuxbrew"

  option "with-check",  "Run a check before install"
  option "with-static", "Build static libraries"
  option "with-brewed-bzip2", "Use brewed bzip2"
  option "with-brewed-zlib", "Use brewed zlib"

  depends_on :autoconf
  depends_on "pkg-config" =>  :build
  depends_on "fontconfig"
  depends_on "freetype"   =>  :run

  depends_on "libxrender" =>  :build
  depends_on "libx11"
  depends_on "libxau"     =>  :run
  depends_on "libxcb"     =>  :run
  depends_on "libxdmcp"   =>  :run
  depends_on "libxrender" =>  :run
  depends_on "bzip2"      =>  :run if build.with?("brewed-bzip2")
  depends_on "zlib"       =>  :run if build.with?("brewed-zlib")
  depends_on "expat"      =>  :run
  depends_on "libpng"     =>  :run

  def install
    args = %W[
      --prefix=#{prefix}
      --sysconfdir=#{etc}
      --localstatedir=#{var}
    ]
	  args << "--disable-static" if !build.with?("static")

    system "./configure", *args
    system "make"
    system "make", "check" if build.with?("check")
    system "make", "install"

  end
end