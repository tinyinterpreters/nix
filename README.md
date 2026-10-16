# Nix

Reusable Nix development tooling for Tiny Interpreters.

## Usage

Start a new interpreter from the template:

```bash
nix flake init -t github:tinyinterpreters/nix
```

Or add the flake as an input to an existing project:

```nix
inputs.ti.url = "github:tinyinterpreters/nix";
```

Then merge the Elm shell into your own dev shell:

```nix
devShells.default = pkgs.mkShell {
  name = "const";
  inputsFrom = [ (ti.lib.elmShell pkgs) ];
};
```

The flake has no inputs of its own, so the shell is built from your `pkgs`. Add packages or a `shellHook` to your shell as usual.

Finally, import the shared recipes in your `justfile`:

```just
import x'${TI_ELM_JUSTFILE}'
```

Run `just` to list them. To replace one, add `set allow-duplicate-recipes` and define your own recipe with the same name.

## `lib`

- [`elmShell`](./lib/elm-shell.nix)
