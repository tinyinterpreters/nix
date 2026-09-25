# Nix

Reusable Nix development tooling for Tiny Interpreters.

## Usage

Add it as an input:

```nix
inputs.ti.url = "github:tinyinterpreters/nix";
```

The flake has no inputs of its own.

```nix
let
  mkElmShell = ti.lib.mkElmShell pkgs;
in
{
  devShells.default = mkElmShell {
    name = "const";
  };
}
```

## `lib`

- [`mkElmShell`](./lib/mk-elm-shell.nix)
