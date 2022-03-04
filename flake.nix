{
  description = "Skeleton";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.simpleFlake {
      inherit self nixpkgs;
      name = "skeleton";

      overlay = final: prev: {
        haskellPackages = prev.haskellPackages.override {
          overrides = hfinal: hprev: {
            backend = hprev.callCabal2nix "backend" ./backend { };
          };
        };
      };

      shell = { pkgs }:
        pkgs.haskellPackages.shellFor {
          packages = p: [ p.backend ];
          buildInputs = [
            pkgs.cabal-install
            pkgs.ghc
            pkgs.ghcid
            pkgs.haskell-language-server
            pkgs.nixpkgs-fmt
            pkgs.nodejs-17_x
            pkgs.ormolu
          ];
        };
    };
}
