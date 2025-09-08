# justfile — per-folder bin outputs (e.g. "01 – Introduction/bin/20_summary")
# Compatible with older `just` and strict quoting
set shell := ["bash", "-eo", "pipefail", "-c"]  # no -u to avoid unbound var errors

# Defaults (override with: just --set cxx=/path/to/g++-14)
cxx      := "g++-14"
cxxflags := "-std=c++17 -O2 -Wall -Wextra"

default: all

# Build ALL .cpp files, placing outputs next to sources: <dir>/bin/<basename>
# Handles spaces and en-dashes using -print0 and bash parameter expansion.
all:
    find . -type f -name '*.cpp' -print0 \
    | xargs -0 -I{} bash -c 'f="$1"; d="$(dirname "$f")"; b="$(basename "$f" .cpp)"; out="$d/bin/$b"; mkdir -p "$d/bin"; echo "  $f -> $out"; "{{cxx}}" {{cxxflags}} "$f" -o "$out"' _ {}

# Build ONE file into <dir>/bin/<basename>
# Usage: just one "01 – Introduction/20_summary.cpp"
one file:
    f="{{file}}"; d="$(dirname "$f")"; b="$(basename "$f" .cpp)"; out="$d/bin/$b"; mkdir -p "$d/bin"; echo "Compiling: $f -> $out"; "{{cxx}}" {{cxxflags}} "$f" -o "$out"; echo "✅ Built: $out"

# Build & RUN one file
# Usage: just run "01 – Introduction/20_summary.cpp"
run file:
    f="{{file}}"; d="$(dirname "$f")"; b="$(basename "$f" .cpp)"; out="$d/bin/$b"; just one "{{file}}"; "$out"

# Clean all per-folder bin directories
clean:
    find . -type d -name 'bin' -maxdepth 3 -exec rm -rf {} +
    echo "🧹 Cleaned all ./<week>/bin folders"

# macOS helper — print Homebrew g++ path (if installed)
brew-gxx:
    if command -v brew >/dev/null 2>&1; then p="$$(brew --prefix gcc 2>/dev/null)/bin"; ls "$$p"/g++-* 2>/dev/null | sort -V | tail -1 || echo "No Homebrew g++ found"; else echo "Homebrew not installed"; fi

# Build all using Homebrew GCC automatically (so bits/stdc++.h works)
all-brew:
    g=$$(just brew-gxx | tail -1); if [ -x "$$g" ]; then echo "Using $$g"; just --set cxx="$$g" all; else echo "No Homebrew g++ found. brew install gcc"; exit 1; fi

which:
    echo "cxx: {{cxx}}"; echo "cxxflags: {{cxxflags}}"; command -v "{{cxx}}" || true; echo ""; "{{cxx}}" --version || true
