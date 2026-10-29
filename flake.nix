{
  description = "Reusable Nix development tooling for Tiny Interpreters";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    flake-elm2nix = {
      url = "github:dwayne/elm2nix/use-elm-0.19.3";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, flake-elm2nix }:
    let
      lib = nixpkgs.lib;
    in
    {
      overlays.default = lib.composeManyExtensions [
        flake-elm2nix.overlays.default
        (final: _: {
          tiPackages.devShell = final.callPackage ./lib/dev-shell.nix {};
        })
      ];

      templates = {
        default = self.templates.elm;

        elm = {
          description = "A basic setup for working on Elm-based tiny interpreters";
          path = ./templates/elm;
        };
      };
    };
}
