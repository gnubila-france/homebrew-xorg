class FontDecMisc < Formula
  desc "X.Org Fonts: font dec misc"
  homepage "http://www.x.org/"
  ### http://www.linuxfromscratch.org/blfs/view/svn/x/x7font.html
  url    "https://www.x.org/pub/individual/font/font-dec-misc-1.0.3.tar.bz2"
  mirror "http://xorg.freedesktop.org/archive/individual/font/font-dec-misc-1.0.3.tar.bz2"
  mirror "http://ftp.x.org/archive/individual/font/font-dec-misc-1.0.3.tar.bz2"
  sha256 "e19ddf8b5f8de914d81675358fdfe37762e9ce524887cc983adef34f2850ff7b"
  # tag "linuxbrew"

  bottle do
    sha256 "28ed77d6c517b4fde69dbacd40e6f5583bd5c0f08649ffadc840928254d689fc" => :x86_64_linux
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

    prefix.install "README" => "font-dec-misc.md"
  end
end
