# nif-extractous

## Runtime Dependencies

ref [extractous](https://github.com/yobix-ai/extractous)

This package bundles both the NIF library (`libnif_extractous`) and its dependency `libtika_native` in a single archive. During build, we modify the library paths to ensure proper runtime loading:

### Platform-specific Handling
- **Linux**: Uses `patchelf` to set the relative RPATH to `$ORIGIN`, allowing the bundled `libtika_native.so` to be found alongside the NIF library
- **macOS**: Uses `install_name_tool` to modify the dynamic library path, ensuring `libtika_native.dylib` is loaded from the same directory as the NIF library using `@loader_path`


This ensures that the NIF library can find its Tika dependency without requiring system-wide installation of Tika or additional configuration. The library is self-contained and should work out of the box when added as a dependency.