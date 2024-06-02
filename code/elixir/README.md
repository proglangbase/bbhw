# Elixir

[Elixir] is a [Functional Programming] language created in 2012, by Jos&#233; 
Valim (pronounced "Jo-zay"), to bring the concurrancy power and distributed 
architecture of [Erlang] to web application development. The language syntax is
based on [Ruby], an object-oriented programming language most noted for it's use
with the [Rails] web development framework.

Elixir is written in Erlang and requires the [OTP] and Elixir runtime systems
be installed. This Elixir script has been tested under Windows and [WSL2] 
running [Ubuntu].

In Windows, the Erlang OTP and Elixir runtime environments [must be installed][winstall] 
before the Elixir script will execute.

In Linux, `run` and `setenv` will install a local copy of the runtimes if they
are not installed, globally.

## Usage

### Parameters

- **countdown** `{integer}`  
  Number of iterations.


### `run` Command

```sh
run [countdown]
```
Executes `bbhw.exs` in the [scripting engine][elixir]. Calls `setenv` to verify
the Erlang OTP and Elixir runtimes are installed.


### `setver` Command

Verifies the Erlang OTP and Elixir runtimes are installed and sets `PATH` to
include the runtime commands. On Linux, a local copy will be installed if not 
found globally.

**Run this command to access the commands listed below.** 

On Linux, run `. ./setenv`.


### Elixir Scripting Engine

```sh
elixir bbhw.exs [countdown]
```
Executes `bbhw.exs` in the Elixir scripting engine.


### Elixir Shell

```sh
iex bbhw.ex 
BBHW.main([countdown]).
```
Compiles and executes `bbhw.ex` in the Elixir shell.


[Elixir]:                  https://elixir-lang.org/
[Elixir: The Documentary]: https://cult.honeypot.io/originals/elixir-the-documentary/
[Erlang]:                  https://en.wikipedia.org/wiki/Erlang_(programming_language)
[Functional Programming]:  https://en.wikipedia.org/wiki/Functional_programming
[OTP]:                     https://en.wikipedia.org/wiki/Open_Telecom_Platform
[Ruby]:                    https://www.ruby-lang.org/en/
[Rails]:                   https://rubyonrails.org/
[Ubuntu]:                  https://ubuntu.com
[winstall]:                https://elixir-lang.org/install.html#windows
[WSL2]:                    https://learn.microsoft.com/en-us/windows/wsl/about
