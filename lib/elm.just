[default]
[private]
list:
    @just --list --unsorted

# Format *.elm files
format:
    elm-format src tests --yes

# Check the formatting of *.elm files
format-check:
    elm-format src tests --validate

# Run the Elm tests
[positional-arguments]
test *args:
    elm-test "$@"

# Check the flake
flake-check:
    nix flake check -L

# Run all checks
check: flake-check format-check test

# Start the Elm REPL
[positional-arguments]
repl *args:
    elm repl "$@"

# Remove build artifacts
clean:
    rm -rf elm-stuff

alias f := format
alias t := test
alias c := check
alias r := repl
