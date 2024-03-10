# F#

[F Sharp] is a [Functional Programming] language developed by Microsoft as part of the .NET Framework.

This F# script was:

- Built with [Visual Studio] to run under[.NET](https://dotnet.microsoft.com/en-us/) 5.0 and later,
- Compiles to an executable file or can be run as an [`fsi`] script, and 
- Has been tested and verified to work on Windows 10 and [Windows Subsystem for Linux][WSL2] (WSL2) running [Ubuntu].

## Usage

### Linux

```sh
run [countdown]
```
- **countdown** `{integer}`  
  Number of iterations.

Executes `bbhw.fsx` in the [`fsi`]. Installs the latest `dotnet` command locally, if necessary.

### Windows (Command Prompt)

```sh
run[.cmd] [countdown]
```
- **countdown** `{integer}`  
  Number of iterations.

Executes `bbhw.fsx` in the [`fsi`]. If the script fails because `dotnet` can't be found, [install the
latest version of the SDK][WindowsInstall] and try again. 

[F Sharp]:                https://en.wikipedia.org/wiki/F_Sharp_(programming_language)
[Functional Programming]: https://en.wikipedia.org/wiki/Functional_programming
[Visual Studio]:          https://visualstudio.microsoft.com/vs/community/
[`fsi`]:                  https://learn.microsoft.com/en-us/dotnet/fsharp/tools/fsharp-interactive/
[WSL2]:                   https://learn.microsoft.com/en-us/windows/wsl/about
[Ubuntu]:                 https://ubuntu.com
[WindowsInstall]:         https://learn.microsoft.com/en-us/dotnet/core/install/windows