class FontSonyMisc < Formula
  desc "X.Org Fonts: font sony misc"
  homepage "http://www.x.org/"
  ### http://www.linuxfromscratch.org/blfs/view/svn/x/x7font.html
  url    "https://www.x.org/pub/individual/font/font-sony-misc-1.0.3.tar.bz2"
  mirror "http://xorg.freedesktop.org/archive/individual/font/font-sony-misc-1.0.3.tar.bz2"
  mirror "http://ftp.x.org/archive/individual/font/font-sony-misc-1.0.3.tar.bz2"
  sha256 "2043a326ba347c9da5ca1e9bc363e2521c3ea40b43b1f9662d333efd4867cff5"
  # tag "linuxbrew"

  bottle do
    sha256 "c77dc9ca04118b63a147cf8c8fb582f661810e3030cf53e17b28ce1467cf428a" => :x86_64_linux
  end

  depends_on "pkg-config" =>  :build
  depends_on "font-util"  =>  :build
  depends_on "bdftopcf"   =>  :build
  depends_on "mkfontdir"  =>  :build
  depends_on "fontconfig" =>  :build
  depends_on "bzip2"      => [:build, :recommended]

  def install
    args = %W[
      --prefix=#{prefix}
      --sysconfdir=#{etc}
      --localstatedir=#{var}
      --disable-dependency-tracking
      --disable-silent-rules
    ]
    args << "--with-compression=bzip2" if build.with?("bzip2")

    system "./configure", *args
    system "make"
    system "make", "install"

    prefix.install "README" => "font-sony-misc.md"
  end
end
