require 'formula'

class ClassDumpZ < Formula
  homepage 'http://code.google.com/p/networkpx/wiki/class_dump_z'
  url 'http://networkpx.googlecode.com/svn/trunk/hk.kennytm.Peace', :using => :svn, :revision => 598
  version '0.2a'

  def patches
    # Remove requirement on specific gcc binaries,
    # Link against system libpcre,
    # Remove processor-specific tuning
    DATA
  end

  def install
    cd 'class-dump-z_src' do
      system "make ../class-dump-z"
    end
    bin.install 'class-dump-z'
  end

  def test
    system "#{bin}/class-dump-z"
  end
end

__END__
diff --git a/class-dump-z_src/Makefile b/class-dump-z_src/Makefile
index 4488823..97c560a 100644
--- a/class-dump-z_src/Makefile
+++ b/class-dump-z_src/Makefile
@@ -1,9 +1,9 @@
 CFLAGS_COMMON=-O2 -I../include -I../src -I/opt/local/include -Wall -W -Wpointer-arith -Wcast-qual -Wcast-align -Wwrite-strings -fno-common -Wconversion -Werror -Wno-unknown-pragmas
 
-CC=gcc-4.2
-CPP=g++-4.2
+CC=gcc
+CPP=g++
 DMD=dmd
-CFLAGS=-msse3 -mtune=core2 $(CFLAGS_COMMON) -m32
+CFLAGS=$(CFLAGS_COMMON) -m32
 DFLAGS=-inline -release -O
 
 CPP_ARMV6=/Developer/Platforms/iPhoneOS.platform/Developer/usr/bin/g++-4.2
@@ -29,7 +29,7 @@ CODESIGN=ldid -S
 all:	../output/mac_x86/class-dump-z ../output/iphone_armv6/class-dump-z
 
 ../class-dump-z: class-dump-z.o ../src/DataFile.o ../src/MachO_File.o MachO_File_ObjC.o MachO_File_ObjC_retrieval.o MachO_File_ObjC_format.o balanced_substr.o crc32.o pseudo_base64.o objc_type.o ../src/string_util.o MachO_File_ObjC_debug.o ../src/get_arch_from_flag.o TSVParser.o
-	$(CPP) $(CFLAGS) -o $@ $^ libpcre.a
+	$(CPP) -lpcre $(CFLAGS) -o $@ $^
 
 ../output/iphone_armv6/class-dump-z: class-dump-z.armv6.o ../src/DataFile.armv6.o ../src/MachO_File.armv6.o MachO_File_ObjC.armv6.o MachO_File_ObjC_retrieval.armv6.o MachO_File_ObjC_format.armv6.o balanced_substr.armv6.o crc32.armv6.o pseudo_base64.armv6.o objc_type.armv6.o ../src/string_util.armv6.o MachO_File_ObjC_debug.armv6.o ../src/get_arch_from_flag.armv6.o TSVParser.armv6.o
 	$(CPP_ARMV6) -lpcre $(CFLAGS_ARMV6) -o $@ $^
