{ elmPackages, mkShell, ... }:

{ name
, extraPackages ? []
, extraShellHook ? ""
}:

mkShell {
  inherit name;

  packages = [
    elmPackages.elm
    elmPackages.elm-format
    elmPackages.elm-test
  ] ++ extraPackages;

  shellHook = ''
    export PROJECT_ROOT="$(git rev-parse --show-toplevel)"
    export PS1="($name)\n$PS1"

    f () {
      elm-format "$PROJECT_ROOT/"{src,tests} "''${@:---yes}"
    }

    t () {
      elm-test "$@"
    }

    r () {
      elm repl "$@"
    }

    c () {
      nix flake check -L &&
      f --validate &&
      t
    }

    clean () {
      rm -rf "$PROJECT_ROOT/elm-stuff"
    }

    echo "Development environment loaded"
    echo ""
    echo "Type 'f' to run elm-format"
    echo "Type 't' to run elm-test"
    echo "Type 'r' to run elm repl"
    echo "Type 'c' to run all checks"
    echo "Type 'clean' to remove build artifacts"
    echo ""

    ${extraShellHook}
  '';
}
