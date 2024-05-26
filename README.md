# nimexeproxy
A small utility to act as a "proxy" when sideloading an `exe` file. It will forward all command line arguments to the real, pre-specified binary just after executing your payload.

## Usage
+ Adjust the payload in `exeproxy.nim`'s `p4yl0ad()` to your needs
+ Build using either a Docker container or the locally install `nim`
    + `PROXYBIN` = absolute or relative path onto which the command line arguments will be forwarded/proxied
    + `BINNAME` = output name of the exeproxy

```sh
make indocker PROXYBIN='C:\\Windows\\system32\\whoami.exe' BINNAME='whoami.exe'
make local PROXYBIN='C:\\Windows\\system32\\whoami.exe' BINNAME='whoami.exe'
```