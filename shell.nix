with import <nixpkgs> { };
let pkgs-unstable = import <nixpkgs-unstable> { };
in
pkgs-unstable.llvmPackages_latest.stdenv.mkDerivation rec {
  name = "syzkaller-env";

  buildInputs = [
    go
    qemu_full
    docker
    debootstrap
    which
  ];

  shellHook = ''
    alias syz-env="$(go env GOPATH)/src/github.com/google/syzkaller/tools/syz-env"
  '';
}
