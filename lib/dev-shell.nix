{ elmPackages
, just
, mkShell
}:

mkShell {
  name = "shell";

  packages = [
    elmPackages.elm
    elmPackages.elm-format
    elmPackages.elm-test
    just
  ];

  shellHook = ''
    export PROJECT_ROOT="$PWD"
    export JUST_JUSTFILE="${./justfile}"
    export JUST_WORKING_DIRECTORY="$PROJECT_ROOT"
  '';
}
