require 'formula'

class Jansson < Formula
  homepage 'http://www.digip.org/jansson/'
  head 'https://github.com/akheron/jansson.git', :using => :git

  option :universal

  if build.head?
    depends_on :autoconf => :build
    depends_on :automake => :build
    depends_on :libtool => :build
  end

  def install
    ENV.universal_binary if build.universal?
    if build.head?
      # see: https://github.com/akheron/jansson#compilation-and-installation
      system "autoreconf", "-i"
    end
    system "./configure", "--disable-dependency-tracking",
                          "--prefix=#{prefix}"
    system "make install"
  end
end
