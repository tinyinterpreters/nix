{
  description = "Reusable Nix development tooling for Tiny Interpreters";

  outputs = { self }:
    {
      lib.elmShell = pkgs: pkgs.callPackage ./lib/elm-shell.nix {};

      templates = {
        default = self.templates.elm;

        elm = {
          description = "A basic setup for working on Elm-based tiny interpreters";
          path = ./templates/elm;
        };
      };
    };
}
