let
  config = {
    packageOverrides = pkgs: rec {
      haskellPackages = pkgs.haskellPackages.override {
        overrides = haskellPackagesNew: haskellPackagesOld: rec {
          blog =
            haskellPackagesNew.callPackage ./default.nix { };
          };
        };
      };
  };
  pkgs = import <nixpkgs> { inherit config; };
in
  { blog = pkgs.haskellPackages.blog; }