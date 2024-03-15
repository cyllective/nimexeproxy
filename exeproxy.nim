import os
import osproc
import streams
import strformat
import winim/lean

proc p4yl0ad() =
    # whoami from https://github.com/chvancooten/NimPlant
    var 
        username: string
        buf : array[257, TCHAR]
        lpBuf : LPWSTR = addr buf[0]
        pcbBuf : DWORD = int32(len(buf))

    discard GetUserName(lpBuf, &pcbBuf)
    for character in buf:
        if character == 0: break
        username.add(char(character))

    MessageBox(0, fmt"The user '{username}' shot first", "nimexeproxy", 0)

proc run(cmd: string, args: seq[string]): (int, string) =
    let process = osproc.startProcess(cmd, args = args, options = {poUsePath, poStdErrToStdOut})
    defer: process.close()
    let retCode = process.waitForExit()
    return (retCode, process.outputStream.readAll())

# binary path set by build.sh
let proxyBin = "{{BINPATH}}"

# run the payload
p4yl0ad()

# run the real binary
let args = commandLineParams()
let (retCode, output) = run(proxyBin, args)
echo output
quit(retCode)
