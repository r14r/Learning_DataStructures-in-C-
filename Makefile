# Space-safe Makefile that builds all .cpp into ./bin mirroring source dirs
CXX ?= g++
CXXFLAGS ?= -std=c++17 -O2 -Wall -Wextra
BIN ?= bin

.PHONY: all clean

all:
	@mkdir -p "$(BIN)"
	@echo "Compiling all .cpp files into $(BIN)..."
	@find . -name '*.cpp' -print0 | while IFS= read -r -d '' file; do \
		out="$(BIN)/$${file#./}"; \
		out="$${out%.cpp}"; \
		mkdir -p "$$(dirname "$$out")"; \
		echo "  $$file -> $$out"; \
		$(CXX) $(CXXFLAGS) "$$file" -o "$$out" || exit $$?; \
	done

clean:
	rm -rf "$(BIN)"
