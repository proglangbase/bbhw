open System
open System.Threading

#if INTERACTIVE  
let args = fsi.CommandLineArgs
#else
let args = Environment.GetCommandLineArgs()
#endif

let isItGood  i = if i >= 0 then Some(i) else None
let isNotGood s = printfn "Invalid countdown %s, try again..." s; None
    
let getCountdown (s:string) = 
  match Int32.TryParse s with 
  | true, i -> isItGood  i 
  | _       -> isNotGood s
    
let rec readInput () =
  printf "countdown: "
  match getCountdown (Console.ReadLine()) with
  | Some(i) -> i
  | None    -> readInput()

let arg       = if args.Length > 1 then getCountdown args[1] else None
let countdown = match arg with | Some(i) -> i | None -> readInput()
  
printf "World, Hello..."
for i = countdown downto 1 do 
  printf $"{i}..."
  Thread.Sleep 1000
printfn "Bye Bye."
