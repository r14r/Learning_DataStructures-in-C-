# Data Structures with C++ – BCA Course (16 Weeks)

This repository contains:
- 16 week folders named with numbers and en dashes (e.g., `01 – Introduction`)
- Each week: `00_README.md`, `00_QnA.md`, `Worksheet.md`, and **20 runnable C++ examples**
- Root materials: CourseBook (MD/PDF), Syllabus (MD/PDF), Worksheets (MD/PDF), Teacher’s Guide (MD/PDF)
- Build systems: Makefile (space-safe) and CMakeLists.txt
- CI and editor support: `.github/` and `.vscode/`

## Build
```bash
make -j           # builds all .cpp to ./bin preserving folder structure
# or
cmake -S . -B build && cmake --build build -j
```
