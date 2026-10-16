{ elmPackages, git, just, mkShell }:

mkShell {
  name = "elm-shell";

  packages = [
    elmPackages.elm
    elmPackages.elm-format
    elmPackages.elm-test
    just
  ];

  shellHook = ''
    export PROJECT_ROOT="$(${git}/bin/git rev-parse --show-toplevel)"
    export TI_ELM_JUSTFILE="${./elm.just}"
  '';
}
