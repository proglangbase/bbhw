# Lisp

[Lisp] was the first high-level [Functional Programming] language and is one of
the oldest languages still in common use, today. The name is derived from 
"LISt Processor" and all program code is written as parenthesized lists with 
operators and operands separated by spaces.

This Lisp script was built to run in [CLISP] and has been tested under [WSL2] 
running [Ubuntu]. The `run` and `setenv` commands will install a local copy of 
the CLISP runtime if it's not installed, globally.

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

[CLISP]:                 https://en.wikipedia.org/wiki/CLISP
[Functional Programming]:  https://en.wikipedia.org/wiki/Functional_programming
[John McCarthy]:         https://en.wikipedia.org/wiki/John_McCarthy_(computer_scientist)
[Lisp]:                  https://en.wikipedia.org/wiki/Lisp_(programming_language)
[Ubuntu]:                  https://ubuntu.com
[WSL2]:                    https://learn.microsoft.com/en-us/windows/wsl/about
