@echo off
where erl /q && where elixir /q && exit /b 0

setlocal
set "PATH_ERLANG=C:\Program Files\Erlang OTP\bin"
set "PATH_ELIXIR=C:\Program Files\Elixir\bin"

set "PATH=%PATH%;%PATH_ERLANG%;%PATH_ELIXIR%"

where erl /q && (
  where elixir /q && (
    endlocal & set "PATH=%PATH%"
    exit /b 0
  )
)

echo.
echo Erlang/OTP and Elixir runtimes are not installed or can't be found.
echo See "README.md" for links to installation instructions.
exit /b 1  
