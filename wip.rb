require 'formula'

class Wip < Formula
  url 'ftp://ftp.astro.umd.edu/progs/morgan/wip2p3.tar.gz'
  homepage 'http://bima.astro.umd.edu/wip'
  sha256 'd4b7da8d171c7bc5d04664378006cce1c093584930fe3e969e9831b611335eef'
  version '2.3'

  depends_on 'pgplot'
  depends_on :x11
  depends_on :fortran

  def patches
    {:p1 => [
             "http://fink.cvs.sourceforge.net/fink/dists/10.4/stable/main/finkinfo/sci/wip.patch",
             DATA
            ]
    }
  end

  def install
    ENV.deparallelize
    inreplace 'makewip', '@PREFIX@', HOMEBREW_PREFIX

    # Undo hardcoded gfortran from the fink patch
    inreplace 'makewip', 'gfortran-fsf-4.8', "#{ENV.fc}"

    system './makewip -readline "" -pgplot "" -xlib {MacOS::X11.lib} -linkopts "-Wl,-bind_at_load -lpng -lz"'
    bin.install ['wip']
    lib.install ['libwip.a']
    doc.install ['wiphelp.dat']
  end

  def test
    system "wip"
  end
end

__END__
diff --git a/src/branch/wipmain.c b/src/branch/wipmain.c
index aa2d1af..bb7f3fe 100644
--- a/src/branch/wipmain.c
+++ b/src/branch/wipmain.c
@@ -70,7 +70,7 @@ Const char *name;
 }
 
 #ifdef PROTOTYPE
-void main(int argc, char *argv[])
+int main(int argc, char *argv[])
 #else
 void main(argc, argv)
 int argc;
