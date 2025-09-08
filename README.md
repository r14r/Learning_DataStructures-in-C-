# Data Structures with C++ – Full Semester (BCA)

[![C++](https://img.shields.io/badge/C%2B%2B-17-blue.svg)]()
[![Build](https://img.shields.io/github/actions/workflow/status/your-org/DataStructures-Course/ci.yml?label=CI)]()
[![License: MIT](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)

A complete 16‑week course for BCA students: **each week contains** a `README.md`, a `QnA.md`, and **20 runnable C++ examples**.
Includes unified **QnA_All.md / QnA_All.pdf**, a **Makefile**, **CMakeLists.txt**, **VS Code config**, and **unit tests**.

## Quick Start
```bash
# Build all with Make
make -j

# OR: Configure & build with CMake
cmake -S . -B build
cmake --build build -j

# Run a single example (Make build outputs to ./bin/)
./bin/Week02_Arrays/example01_create
```

## VS Code
- Press `⌘⇧B` / `Ctrl+Shift+B` to see tasks (Make / CMake / active file build).
- Use the **Run and Debug** sidebar to run the **Active File** or **All Tests**.

## Tests
Tests use a tiny header-only harness in `tests/mini_test.h`.
Run:
```bash
cmake -S . -B build
cmake --build build -j
./bin/Debug/tests_tests_all || ./bin/tests_tests_all
```

## Layout
- `WeekXX_*` – lecture notes, Q&A, 20 examples each
- `tests/` – unit tests across topics
- `QnA_All.md` + `QnA_All.pdf` – consolidated reference
- `Makefile` + `CMakeLists.txt` – build systems
- `.vscode/` – editor config (tasks & launch)

## License
MIT – see [LICENSE](LICENSE).
