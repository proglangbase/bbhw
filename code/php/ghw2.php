<?php
$countdown = -1;

function get_countdown($input) {
  $countdown = (int)$input;
  if ($countdown <= 0) {
    $countdown = -1;
    echo "Invalid countdown $input, try again...\n";
  }
  return $countdown;
}

if ($argc > 1) {
  $countdown = get_countdown($argv[1]);
} 

while ($countdown < 0) {
  echo 'countdown: ';
  $countdown = get_countdown(rtrim(fgets(STDIN, 1024)));
}

echo "World, Hello...";
for ($i = $countdown; $i > 0; $i--) {
  echo "$i...";
  sleep(1);
}
echo "Goodbye.\n";

  