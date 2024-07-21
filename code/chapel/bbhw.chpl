config var count : int = -1;	// Accessible via --count= argument

use IO;		// stdout, BadFormatError
use Time;	// sleep
use ArgumentParser;

proc parsecount(s: string) {
  try   { count = s : uint : int; }	// Overflow can make it negative :(
  catch { writef("Invalid countdown %\"S, try again...\n", s.strip()); }
}
proc main(args:[]string) {
  var parser = new argumentParser();
  const arg = parser.addArgument(name="count", numArgs=0..1);
  parser.parseArgs(args);
  if count<0 && arg.hasValue() then parsecount(arg.value());
  while (count<0) {
    write("countdown: ");
    stdout.flush();
    var s : string;
    if !readLine(s) then exit(1); // EOF
    parsecount(s);
  }
  write("World, Hello...");
  for i in 1..count by -1 {
    write(i, "...");
    stdout.flush();
    sleep(1);
  }
  writeln("Bye Bye.");
}
