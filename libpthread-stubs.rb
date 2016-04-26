class LibpthreadStubs < Formula
  desc "Xorg Protocol Headers: libpthread-stubs"
  homepage "http://www.x.org/"
  url    "ftp://ftp.x.org/pub/individual/lib/libpthread-stubs-0.1.tar.bz2"
  sha256 "004dae11e11598584939d66d26a5ab9b48d08a00ca2d00ae8d38ee3ac7a15d65"

  depends_on "pkg-config"         =>  :build
  depends_on "util-macros"        =>  :build

  def install
    args = %W[
      --prefix=#{prefix}
      --sysconfdir=#{etc}
      --localstatedir=#{var}
      --disable-dependency-tracking
      --disable-silent-rules
    ]

    system "./configure", *args
    system "make", "install"
  end
end
