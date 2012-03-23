require 'formula'

class Ds9 < Formula
  homepage 'http://hea-www.harvard.edu/RD/ds9/'
  url 'http://hea-www.harvard.edu/saord/download/ds9/darwinsnowleopard/ds9.darwinsnowleopard.6.2.tar.gz'
  md5 'a992e7e99bbb0d4eaf64117763b36b1a'

  def install
    # ds9 requires the companion zip file to live in the same location as the binary
    bin.install 'ds9', 'ds9.zip'
  end

  def test
    system "ds9"
  end
end
