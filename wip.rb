require 'formula'

class Wip < Formula
  url 'ftp://ftp.astro.umd.edu/progs/morgan/wip2p3.tar.gz'
  homepage 'http://bima.astro.umd.edu/wip'
  md5 '189c36b5f8079673b0a5060168bb6070'
  version '2.3'
  depends_on 'pchote/astro/pgplot'
  def patches
    {:p1 => [
             "http://fink.cvs.sourceforge.net/fink/dists/10.4/stable/main/finkinfo/sci/wip.patch",
            ]
    }
  end

  def install
    ENV.x11
    system './makewip -readline "" -pgplot "" -xlib /usr/X11R6/lib -linkopts "-Wl,-framework -Wl,Foundation -Wl,-bind_at_load -lpng -lz"'
    bin.install ['wip']
    lib.install ['libwip.a']
  end

  def test
    system "wip"
  end
end
