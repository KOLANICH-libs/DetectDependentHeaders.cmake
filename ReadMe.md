DetectDependentHeaders.cmake
============================

Just a very niche CMake library that parses C++ files for `#include` directives and returns the names of the included files.

PATHS ARE NOT RESOLVED.

Is used in
* some repos
* containing many small header-only libs
* which components depend on each other,
* and subcomponents names are the same as headers names.

The module is intentionally undocumented, read its source code to understand what to expect from it.
