class FontMicroMisc < Formula
  desc "X.Org Fonts: font micro misc"
  homepage "http://www.x.org/"
  ### http://www.linuxfromscratch.org/blfs/view/svn/x/x7font.html
  url    "https://www.x.org/pub/individual/font/font-micro-misc-1.0.3.tar.bz2"
  mirror "http://xorg.freedesktop.org/archive/individual/font/font-micro-misc-1.0.3.tar.bz2"
  mirror "http://ftp.x.org/archive/individual/font/font-micro-misc-1.0.3.tar.bz2"
  sha256 "9a3381c10f32d9511f0ad4179df395914c50779103c16cddf7017f5220ed8db6"
  # tag "linuxbrew"

  bottle do
    sha256 "7f82a311ef48c929100ca8c25efc4f08e892c46297352cbea64a0e2b625ff778" => :x86_64_linux
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

    prefix.install "README" => "font-micro-misc.md"
  end
end
