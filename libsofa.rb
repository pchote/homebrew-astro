require 'formula'

class Libsofa < Formula
  url 'http://www.iausofa.org/2016_0503_C/sofa_c-20160503_a.tar.gz'
  homepage 'http://www.iausofa.org/'
  sha256 '260e222c8eaf484c6ea0e7f73fa99e8821d1b70adf4449951c7cc1ff10b4bc3b'
  version '20150503_a'

  def install
    cd '20160503_a/c/src' do
      system "make"
      lib.install "libsofa_c.a"
      include.install "sofa.h"
      include.install "sofam.h"
    end
  end
end
