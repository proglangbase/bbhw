# F#

[F Sharp](https://en.wikipedia.org/wiki/F_Sharp_(programming_language)) is a
[Functional Programming](https://en.wikipedia.org/wiki/Functional_programming) language
developed by Microsoft as part of the .NET Framework.

This F# script was built with [Visual Studio](https://visualstudio.microsoft.com/vs/community/) to
[.NET](https://dotnet.microsoft.com/en-us/) 5.0 and later. It can be compiled to an executable file or 
run as a script. It has been tested and verified to work on Windows 10 and [Windows Subsystem for Linux](https://learn.microsoft.com/en-us/windows/wsl/about) 
(WSL2) running [Ubuntu](https://ubuntu.com).

| File    | Description |
| ------- | --------------------------------------
| bbhw.fs | F# module used by both app and script. |
| run.fs  | F# entry point for app when built with Visual Studio. |
| run.fsx | F# script run under [`fsi`](https://learn.microsoft.com/en-us/dotnet/fsharp/tools/fsharp-interactive/) |

## Usage

### Linux

```sh
run [countdown]
```
- **countdown** `{integer}`  
  Number of iterations.

Executes `run.fsx` in the `fsi`. Installs the latest `dotnet` command locally, if necessary.

### Windows (Command Prompt)

```sh
run[.cmd] [countdown]
```
- **countdown** `{integer}`  
  Number of iterations.

Executes `run.fsx` in the `fsi`. If the script fails because `dotnet` can't be found, [install the
latest version](https://learn.microsoft.com/en-us/dotnet/core/install/windows) and try again. 