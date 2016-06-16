class XorgProtocols < Formula
  desc "X.Org Protocols"
  homepage "http://www.x.org/" ### http://www.linuxfromscratch.org/blfs/view/svn/x/x7lib.html
  url      "https://raw.githubusercontent.com/Linuxbrew/homebrew-xorg/master/README.md"
  version  "latest"
  sha256   "7d5cca1b4bdc2a3aefe2ef7fedf919ea8fe4f907493d5d31661c5f8fa81a3161"
  # tag "linuxbrew"

  bottle do
    cellar :any
    sha256 "7ed972478c2ce565fb5abb7b3fb2377d29671137b8ec46f30ffcf9e966dd96d0" => :x86_64_linux
  end

  option "with-specs", "Build specifications (where applicable)"

  # with specs
  reswithspec = %w[bigreqsproto fontsproto inputproto kbproto recordproto scrnsaverproto xcmiscproto xextproto xproto]

  # all resources. Sequence in which the packages are installed might be important
  resources = %w[bigreqsproto compositeproto damageproto dmxproto dri2proto dri3proto fixesproto fontsproto glproto inputproto kbproto presentproto randrproto recordproto renderproto resourceproto scrnsaverproto videoproto xcmiscproto xextproto xf86bigfontproto xf86dgaproto xf86driproto xf86vidmodeproto xineramaproto xproto]

  resources.each do |r|
    if reswithspec.include?(r) and build.with?("specs")
      depends_on r => "with-specs"
    else
      depends_on r
    end
  end

  def install
    ohai "Xorg Protocols have been installed!"
    prefix.install "README.md" => "xorg-protocols.md"
  end
end
