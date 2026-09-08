{
  description = "Reusable Nix development tooling for Tiny Interpreters";

  outputs = _:
    {
      lib.mkElmShell = pkgs: pkgs.callPackage ./shells/elm.nix {};
    };
}
