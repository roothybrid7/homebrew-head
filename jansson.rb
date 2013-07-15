require 'formula'

class Jansson < Formula
  homepage 'http://www.digip.org/jansson/'
  url 'http://www.digip.org/jansson/releases/jansson-2.4.tar.bz2'
  sha1 'f11ff89dd484d89210d9f52a9ccc2ce2b9d2c1ae'

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
