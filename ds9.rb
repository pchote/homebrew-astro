require 'formula'

class Ds9 < Formula
  homepage 'http://hea-www.harvard.edu/RD/ds9/'
  url 'http://hea-www.harvard.edu/RD/ds9/download/darwinmountainlion/ds9.darwinmountainlion.7.2.tar.gz'
  sha1 '4d7d17fd619ef5aa2fc14618811207faad797d76'

  def install
    # ds9 requires the companion zip file to live in the same location as the binary
    bin.install 'ds9', 'ds9.zip'
  end

  def test
    system "ds9"
  end
end
