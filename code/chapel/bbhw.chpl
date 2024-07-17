config var count : int = -1;	// Accessible via --count= argument

use IO;		// stdout, BadFormatError
use Time;	// sleep
use ArgumentParser;

proc main(args:[]string) throws {
  const badCount = "Bad count %\"S.\n";
  var parser = new argumentParser();
  var arg = parser.addArgument(name="count", numArgs=0..1);
  parser.parseArgs(args);
  if (count<0 && arg.hasValue()) {
    var s = arg.value();
    try {
      count = s : uint : int;
    } catch e:IllegalArgumentError {
      writef(badCount, s);
    }
  }
  while (count<0) {
    write("Count? ");
    stdout.flush();
    try! {
      // Note: readf will accept leading whitespace including newlines.
      if (!readf("%u\n", count)) {
        exit();	// Happens for EOF.
      }
    } catch e:BadFormatError {
      var s:string;
      readln(s);	// stdin reverted failed read
      writef(badCount, s);
      count = -1;	// 12foo != 12. %u may have worked but \n failed.
    }
  }
  write("World, Hello...");
  for i in 1..count by -1 do {
    write(i, "...");
    stdout.flush();
    sleep(1);
  }
  writeln("Bye Bye.");
}
