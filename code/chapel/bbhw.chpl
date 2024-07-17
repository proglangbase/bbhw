config var count : int = -1;	// Accessible via --count= argument

use IO;		// stdout, BadFormatError
use Time;	// sleep
use ArgumentParser;

proc parsecount(s: string) {
    try {
      count = s : uint : int;
    } catch {
      writef("Bad count %\"S.\n", s.strip());
    }
}
proc main(args:[]string) throws {
  var parser = new argumentParser();
  var arg = parser.addArgument(name="count", numArgs=0..1);
  parser.parseArgs(args);
  if (count<0 && arg.hasValue()) {
    parsecount(arg.value());
  }
  while (count<0) {
    write("Count? ");
    stdout.flush();
    var s : string;
    if (!readLine(s)) { exit(); /* EOF */ }
    parsecount(s);
  }
  write("World, Hello...");
  for i in 1..count by -1 do {
    write(i, "...");
    stdout.flush();
    sleep(1);
  }
  writeln("Bye Bye.");
}
