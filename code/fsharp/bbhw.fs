module bbhw

open System
open System.Threading

let isItGood     i = if i > 0 then Some(i) else None
let isNotGood    s = printfn "Invalid countdown %s, try again..." s; None
let printAndWait s = printf "%s..." s; Thread.Sleep 1000
    
let getCountdown (s:string) = 
  match Int32.TryParse s with 
  | true, i -> isItGood  i 
  | _       -> isNotGood s
    
let rec readInput () =
  printf "countdown: "
  match getCountdown (Console.ReadLine()) with
  | Some(i) -> i
  | None    -> readInput()
  
let run (args:string[]) =
  let arg       = if args.Length = 2 then getCountdown args[1] else None
  let countdown = 
    match arg with 
    | Some(i) -> i 
    | None    -> readInput()
  
  printAndWait "World, Hello"
  for i = countdown downto 1 do i |> string |> printAndWait
  printfn "Bye Bye."
