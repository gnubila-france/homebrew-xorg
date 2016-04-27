class MesaGlu < Formula
  homepage "http://www.mesa3d.org"
  url "ftp://ftp.freedesktop.org/pub/mesa/glu/glu-9.0.0.tar.bz2"
  sha256 "1f7ad0d379a722fcbd303aa5650c6d7d5544fde83196b42a73d1193568a4df12"

  depends_on :x11
  depends_on "mesa"

  option "enable-static", "Build static library"

  def install

    args = %W[
      --prefix=#{prefix}
      --disable-debug
      --disable-dependency-tracking
    ]

    if build.include? "enable-static"
      args << "--enable-static"
    end

    system "./configure", *args
    system "make", "install"
  end
end
