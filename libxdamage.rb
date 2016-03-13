class Libxdamage < Formula
  desc "Xorg Libraries: libXdamage"
  homepage "http://www.x.org/" ### http://www.linuxfromscratch.org/blfs/view/svn/x/x7lib.html
  url    "http://ftp.x.org/pub/individual/lib/libXdamage-1.1.4.tar.bz2"
  sha256 "7c3fe7c657e83547f4822bfde30a90d84524efb56365448768409b77f05355ad"
  # tag "linuxbrew"

  option "with-check",  "Run a check before install"
  option "with-static", "Build static libraries"

  depends_on :autoconf
  depends_on "pkg-config" =>  :build
  depends_on "fontconfig" =>  :build
  depends_on "damageproto" => :build
  depends_on "libxfixes"
  depends_on "fixesproto" =>  :build
  depends_on "xextproto"  =>  :build
  depends_on "libx11"
  depends_on "libxau"     =>  :run
  depends_on "libxcb"     =>  :run
  depends_on "libxdmcp"   =>  :run


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