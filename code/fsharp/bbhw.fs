open System
open System.Threading

let badInput      s         = printfn "Invalid countdown %s, try again..." s; None
let mayBeGood     i         = if i > 0 then Some(i) else None
let getCountdown (s:string) = match Int32.TryParse s with | true, i -> mayBeGood i | _ -> badInput s
let printAndWait  s         = printf "%s..." s; Thread.Sleep 1000

let rec readInput () =
  Console.Write("countdown: ")
  match getCountdown (Console.ReadLine()) with
  | Some(i) -> i
  | None    -> readInput()

let args = Environment.GetCommandLineArgs()
let arg       = if args.Length = 2 then getCountdown args[1] else None
let countdown = match arg with | Some(i) -> i | None -> readInput()

printAndWait "World, Hello"
for i in [1..countdown] do i |> string |> printAndWait
printfn "Bye Bye."
