{
  description = "Reusable Nix development tooling for Tiny Interpreters";

  outputs = _:
    {
      lib.mkElmShell = import ./lib/mk-elm-shell.nix;
    };
}
