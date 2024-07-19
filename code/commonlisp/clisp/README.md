# CLISP

[CLISP] is a an implementation of [Common Lisp] and the `bbhw.lisp` script has 
been tested under [WSL2] running [Ubuntu]. The `run` and `setenv` commands will 
install a local copy of the CLISP runtime if it's not installed, globally.

## Usage

### Parameters

- **countdown** `{integer}`  
  Number of iterations.


### `run` Command

```sh
run [countdown]
```
Executes `bbhw.lisp` in the CLISP scripting engine. Calls `setenv` to verify the 
CLISP runtime is installed.


### `setenv` Command

Verifies the CLISP runtime is installed and sets `PATH` to include the runtime 
commands. On Linux, a local copy will be installed if not found globally.

**Run this command to access the commands listed below.** 

On Linux, run `. ./setenv`.


### CLISP Scripting Engine

```sh
clisp bbhw.lisp [countdown]
```
Executes `bbhw.lisp` in the CLISP scripting engine.

[CLISP]:       https://en.wikipedia.org/wiki/CLISP
[Common Lisp]: https://en.wikipedia.org/wiki/Common_Lisp  
[Ubuntu]:      https://ubuntu.com
[WSL2]:        https://learn.microsoft.com/en-us/windows/wsl/about
