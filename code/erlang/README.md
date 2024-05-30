# Erlang/OTP

[Erlang] is a [Functional Programming] language developed by Ericsson specifically for development of 
telephony applications. The [OTP] is a set of libraries, written in Erlang, comprising the Erlang
interpreter, compiler, and runtime shell.

This Erlang script has been tested under Windows and [WSL2] running [Ubuntu].

## Installing the OTP

Under Linux, the `run` command will optionally install a local copy of the OTP, if a global one is not
found, before running the Erlang script. It takes about 10 minutes to install.

There is no command to run the script under Windows and [Installing the OTP] globally is the best 
option for Windows and Linux. 


## Usage

### Parameters

- **countdown** `{integer}`  
  Number of iterations.

### `run` Command - Linux only

```sh
run [countdown]
```
Executes `bbhw.erl` in the [scripting engine][escript]. Optionally downloads and builds a local copy 
of the OTP if it's not installed, globally.
  

### Erlang Scripting Engine

```sh
escript bbhw.erl [countdown]
```
Executes `bbhw.erl` in the [scripting engine][escript].

### Erlang Shell

```sh 
c(bbhw).
bbhw:main([countdown]).
```
Compiles and executes `bbhw.erl` in the Erlang shell.


### Command Line

```sh
erlc bbhw.erl
erl -noshell -s bbhw main [countdown] -s init stop
```
Compiles `bbhw.erl` and executes it in the runtime system without invoking the shell.


[Erlang]:                 https://en.wikipedia.org/wiki/Erlang_(programming_language)
[OTP]:                    https://en.wikipedia.org/wiki/Open_Telecom_Platform
[escript]:                https://www.erlang.org/doc/man/escript
[Installing the OTP]:     https://www.erlang.org/downloads
[Functional Programming]: https://en.wikipedia.org/wiki/Functional_programming
[WSL2]:                   https://learn.microsoft.com/en-us/windows/wsl/about
[Ubuntu]:                 https://ubuntu.com
