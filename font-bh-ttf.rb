class FontBhTtf < Formula
  desc "X.Org Fonts: font bh ttf"
  homepage "http://www.x.org/"
  ### http://www.linuxfromscratch.org/blfs/view/svn/x/x7font.html
  url    "https://www.x.org/pub/individual/font/font-bh-ttf-1.0.3.tar.bz2"
  mirror "http://xorg.freedesktop.org/archive/individual/font/font-bh-ttf-1.0.3.tar.bz2"
  mirror "http://ftp.x.org/archive/individual/font/font-bh-ttf-1.0.3.tar.bz2"
  sha256 "1b4bea63271b4db0726b5b52c97994c3313b6023510349226908090501abd25f"
  # tag "linuxbrew"

  bottle do
    sha256 "f01863adce18332c22535971770a6a67a2d2bc111ab93beff33d06b9a8d3e164" => :x86_64_linux
  end

  depends_on "pkg-config" =>  :build
  depends_on "font-util"  =>  :build
  depends_on "bdftopcf"   =>  :build
  depends_on "mkfontdir"  =>  :build
  depends_on "fontconfig" =>  :build

  def install
    args = %W[
      --prefix=#{prefix}
      --sysconfdir=#{etc}
      --localstatedir=#{var}
      --disable-dependency-tracking
      --disable-silent-rules
    ]

    system "./configure", *args
    system "make"
    system "make", "install"

    prefix.install "README" => "font-bh-ttf.md"
  end
end
