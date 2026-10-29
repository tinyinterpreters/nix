{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    ti = {
      url = "github:tinyinterpreters/nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, ti }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        overlays = [ ti.overlays.default ];
      };
    in
    {
      devShells.${system}.default = pkgs.mkShell {
        name = "interpreter";
        inputsFrom = [ pkgs.tiPackages.devShell ];
      };
    };
}
