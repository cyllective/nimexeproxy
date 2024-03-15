# nimexeproxy
A small utility to act as a "proxy" when sideloading an `exe` file. It will forward all command line arguments to the real, pre-specified binary just after executing your payload.

## Usage
Adjust the payload in `exeproxy.nim`'s `p4yl0ad()` to your needs, then build using the absolute or relative path:

```sh
# Build inside a Docker
make indocker BINPATH='C:\\Windows\\system32\\ipconfig.exe'
# Build locally (needs nim installed) 
make local BINPATH='C:\\Windows\\system32\\ipconfig.exe'
```