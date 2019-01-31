with import <nixpkgs> {};
let cc = clang; # gcc
in derivation {
  name = "hello";
  builder = "${bash_5}/bin/bash";
  args = [ ./builder.bash ];

  inherit cc llvm;
  binutils = binutils-unwrapped;
  buildInputs = [
    cc
    coreutils
    gawk
    gnugrep
    gnumake
    gnused
    gnutar
    gzip
    llvm
  ];

  AR= "llvm-ar";
  RANLIB = "llvm-ranlib";
  CC = "clang";

  src = builtins.fetchurl http://ftp.gnu.org/gnu/hello/hello-2.10.tar.gz;
  system = builtins.currentSystem;
}
