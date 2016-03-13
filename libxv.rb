class Libxv < Formula
  desc "Xorg Libraries: libXv"
  homepage "http://www.x.org/" ### http://www.linuxfromscratch.org/blfs/view/svn/x/x7lib.html
  url    "http://ftp.x.org/pub/individual/lib/libXv-1.0.10.tar.bz2"
  sha256 "55fe92f8686ce8612e2c1bfaf58c057715534419da700bda8d517b1d97914525"
  # tag "linuxbrew"

  option "with-check",  "Run a check before install"
  option "with-static", "Build static libraries"

  depends_on :autoconf
  depends_on "pkg-config" =>  :build
  depends_on "fontconfig" =>  :build

  depends_on "libx11"
  depends_on "libxau"     =>  :run
  depends_on "libxcb"     =>  :run
  depends_on "libxdmcp"   =>  :run
  depends_on "libxext"
  depends_on "xextproto"  =>  :build
  depends_on "videoproto" =>  :build

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