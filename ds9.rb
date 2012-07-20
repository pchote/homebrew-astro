require 'formula'

class Ds9 < Formula
  homepage 'http://hea-www.harvard.edu/RD/ds9/'
  url 'http://hea-www.harvard.edu/saord/download/ds9/darwinlion/ds9.darwinlion.7.0.2.tar.gz'
  sha1 '073cdf2c06f7fb5f6811d8da05ce8ed77a7b3c81'

  def install
    # ds9 requires the companion zip file to live in the same location as the binary
    bin.install 'ds9', 'ds9.zip'
  end

  def test
    system "ds9"
  end
end
