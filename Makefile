# Simple Makefile for SLALIB
# Requires: gfortran
# Compatible with Ubuntu and other Linux distributions

# Compiler settings
FC = gfortran
FFLAGS = -fPIC -fdefault-integer-8 -O2
LDFLAGS = -shared

# Library name
LIBNAME = libslalib.so

# Source files (all .f files except sla_test.f)
SOURCES = $(filter-out sla_test.f, $(wildcard *.f))
OBJECTS = $(SOURCES:.f=.o)

# Test program
TEST_SRC = sla_test.f
TEST_OBJ = sla_test.o
TEST_BIN = sla_test

# Default target
all: $(LIBNAME)

# Build the shared library
$(LIBNAME): $(OBJECTS)
	$(FC) $(LDFLAGS) -o $@ $^
	@echo "Library $(LIBNAME) built successfully"

# Compile Fortran source files
%.o: %.f
	$(FC) $(FFLAGS) -c $< -o $@

# Build test program
test: $(TEST_BIN)

$(TEST_BIN): $(TEST_OBJ) $(LIBNAME)
	$(FC) -o $@ $(TEST_OBJ) -L. -lslalib -Wl,-rpath,.
	@echo "Test program built successfully"

# Run the test
check: test
	./$(TEST_BIN)

# Clean up build artifacts
clean:
	rm -f *.o $(LIBNAME) $(TEST_BIN)
	@echo "Cleaned up build artifacts"

# Install library (optional - set PREFIX to customize)
PREFIX ?= /usr/local
install: $(LIBNAME)
	install -d $(PREFIX)/lib
	install -m 644 $(LIBNAME) $(PREFIX)/lib/
	install -d $(PREFIX)/include
	install -m 644 slalib.h $(PREFIX)/include/
	@echo "Installed to $(PREFIX)"

# Uninstall
uninstall:
	rm -f $(PREFIX)/lib/$(LIBNAME)
	rm -f $(PREFIX)/include/slalib.h
	@echo "Uninstalled from $(PREFIX)"

# Display help
help:
	@echo "SLALIB Makefile targets:"
	@echo "  all        - Build the shared library (default)"
	@echo "  test       - Build the test program"
	@echo "  check      - Build and run the test program"
	@echo "  clean      - Remove all build artifacts"
	@echo "  install    - Install library to PREFIX (default: /usr/local)"
	@echo "  uninstall  - Remove installed files"
	@echo "  help       - Show this help message"
	@echo ""
	@echo "Usage examples:"
	@echo "  make              # Build the library"
	@echo "  make clean        # Clean build files"
	@echo "  make check        # Build and run tests"
	@echo "  make install PREFIX=/opt/local  # Install to custom location"

.PHONY: all test check clean install uninstall help
