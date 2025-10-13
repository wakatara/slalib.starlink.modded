# SLALIB - Positional Astronomy Library

Modified version of the Starlink Astrometry Library (SLALIB) with tweaks by Jan Keyna of the University of Hawaii. Streamlined for for easy(ier) compilation on Linux and OSX systems.

## About

SLALIB is a comprehensive library of routines for positional astronomy. It provides functions for:

- Coordinate transformations
- Celestial mechanics calculations
- Time and date conversions
- Precession, nutation, and aberration
- Planetary ephemerides
- And much more

This is a modified version curated by Jan Kleyna originally derived from the [Starlink Project](https://github.com/Starlink/starlink).

## Requirements

- **gfortran** (GNU Fortran compiler)
- **make**
- **Ubuntu 24.04** or any modern Linux distribution

### Installing Dependencies on Ubuntu

```bash
sudo apt-get update
sudo apt-get install -y gfortran make
```

## Building the Library

### Quick Start

```bash
# Build the shared library
make

# Build and run tests (optional)
make check

# Clean build artifacts
make clean
```

### Build Options

The Makefile supports several targets:

- `make` or `make all` - Build the shared library `libslalib.so`
- `make test` - Build the test program
- `make check` - Build and run the test program
- `make clean` - Remove all build artifacts
- `make install` - Install library to system (default: `/usr/local`)
- `make install PREFIX=/custom/path` - Install to custom location
- `make uninstall` - Remove installed files
- `make help` - Display all available targets

### Docker Build Example

```dockerfile
FROM ubuntu:24.04

# Install dependencies
RUN apt-get update && apt-get install -y \
    gfortran \
    make \
    && rm -rf /var/lib/apt/lists/*

# Copy source
COPY . /usr/src/slalib
WORKDIR /usr/src/slalib

# Build
RUN make

# Install to system
RUN make install

# Test
RUN make check
```

## Using the Library

After building, you'll have `libslalib.so` in the current directory.

### Linking with your program

```bash
gfortran -o myprogram myprogram.f -L. -lslalib -Wl,-rpath,.
```

Or after installation:

```bash
gfortran -o myprogram myprogram.f -lslalib
```

### C Programs

Include the header and link with the library:

```c
#include <slalib.h>
```

```bash
gcc -o myprogram myprogram.c -lslalib -lgfortran
```

## Important Notes

- This library uses **64-bit integers** (`-fdefault-integer-8` flag)
- The library is compiled with position-independent code (`-fPIC`) for shared library compatibility
- All original documentation is preserved in `read.me` and `sun67.tex`

## Files

### Source Files

- `*.f` - Fortran 77 source files (library routines)
- `sla.c` - C wrapper functions
- `slalib.h` - C header file
- `f77.h.in` - Fortran header template

### Documentation

- `read.me` - Original SLALIB documentation
- `sun67.tex` - Comprehensive LaTeX documentation
- `sla.news` - Release notes
- `SLA_CONDITIONS` - License information
- `Notes` - Platform porting notes

### Test Programs

- `sla_test.f` - Fortran test suite
- `slaTest.c` - C test program

## License

Copyright (C) 1995-2005 Rutherford Appleton Laboratory

This program is free software; you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation; either version 2 of the License, or
(at your option) any later version.

See the `SLA_CONDITIONS` file for full license details.

## Modifications

This version has been cleaned up and simplified for modern Linux builds:

- Removed platform-specific build scripts for VMS, Windows, and Mac
- Removed autotools build system (configure.ac, Makefile.am, etc.)
- Added simple, portable Makefile
- Cleaned up compiled artifacts and temporary files

Original source: <https://github.com/Starlink/starlink/tree/master/libraries/sla>

## Support

For issues with the original SLALIB functionality, refer to the original documentation in `read.me` and `sun67.tex`.

For build issues with this modified version, check that:

1. gfortran is installed and in your PATH
2. You're running on a Linux system or compatible environment
3. All source `.f` files are present
