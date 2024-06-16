@echo off
setlocal
call setenv || exit /b 1
elixir bbhw.exs %*
