{ pkgs ? (import ./nix/nixpkgs { inherit system; })
, system ? builtins.currentSystem
}:

let
  source = pkgs.lib.sourceByRegex ./. [
    "^.*\.md$"
    "^app.*$"
    "^data.*$"
    "^blog\.cabal$"
    "^site\.hs$"
  ];
  haskellPackages =  pkgs.haskellPackages.override {
    overrides = blogOverlay;
  };
  blogOverlay = self: super: {
    "blog" = super.callCabal2nix "blog" source { };
  };
in with haskellPackages; {
  blog = blog;
  shell = shellFor {
    packages = ps: [
      ps.blog
    ];
    buildInputs = [
      hlint
      ghcid
    ];
  };
  inherit blogOverlay;
}
