{ system ? builtins.currentSystem }:
let
  rev = "fe9aef0135d6496e2b2121c37217a57af78d4e69";
  sha256 = "0k4n5hmjrcxa2nfdlvkx16s001khda4h22ng27bxc11rn9rf3d33";
  nixpkgs = builtins.fetchTarball {
    url = "https://github.com/NixOS/nixpkgs/archive/${rev}.tar.gz";
    inherit sha256;
  };
  pkgs = import nixpkgs {
    inherit system;
    config.allowUnfree = true;
    config.allowBroken = true;
  };
in pkgs
