require 'formula'

class Libsofa < Formula
  url 'http://www.iausofa.org/2015_0209_C/sofa_c-20150209_a.tar.gz'
  homepage 'http://www.iausofa.org/'
  sha1 '03302dae4b3700f61044ba83cc4859db890c8c89'
  version '20150209_a'

  def install
    cd '20150209_a/c/src' do
      system "make"
      lib.install "libsofa_c.a"
      include.install "sofa.h"
      include.install "sofam.h"
    end
  end
end
