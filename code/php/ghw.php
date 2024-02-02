<?php
$countdown = -1;
$invalid   = "Invalid countdown %s, try again...\n";

if ($argc > 1) {
  $input = $argv[1];
  $countdown = (int)$argv[1];
  if ($countdown <= 0) {
    $countdown = -1;
    printf($invalid, $argv[1]);
  }
}

while ($countdown < 0) {
  echo 'countdown: ';
  $input = rtrim(fgets(STDIN, 1024));
  $countdown = (int)$input;
  if ($countdown <= 0) {
    $countdown = -1;
    printf($invalid, $input);
  }
}

echo "World, Hello...";
for ($i = $countdown; $i > 0; $i--) {
  echo "$i...";
  sleep(1);
}
echo "Goodbye.\n";
