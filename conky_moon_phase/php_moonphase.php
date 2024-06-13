<?php
/* require_once 'Composer/autoload.php'; */
require_once(__DIR__ . '/vendor/autoload.php');
use Solaris\MoonPhase;

date_default_timezone_set('America/New_York');
$moonPhase = new MoonPhase();

$age = round($moonPhase->getAge(), 1);
$stage = $moonPhase->getPhase() < 0.5 ? 'waxing' : 'waning';
$distance = number_format(round($moonPhase->getDistance(), 2));
$next = gmdate('G:i:s, j M Y', (int) $moonPhase->getPhaseNextNewMoon());
$fullMoon = gmdate('G:i:s, j M Y', (int) floor($moonPhase->getPhaseFullMoon()));
$nextFullMoonTimestamp = $moonPhase->getPhaseNextFullMoon();
$nextFullMoon = gmdate('G:i:s, j M Y', (int) floor($nextFullMoonTimestamp));

$illuminationFraction = $moonPhase->getIllumination();
$illuminationPercentage = round($illuminationFraction * 100, 2);

echo 'The moon is currently ' . $age . ' days old, and is therefore ' . $stage . '. '    ;
echo PHP_EOL;
echo '' . $illuminationPercentage . '% illuminated and ' . $distance . ' km from the centre of the Earth. ';
echo PHP_EOL;
echo 'The full moon is at ' . $fullMoon . '. ';
echo PHP_EOL;
echo 'The next full moon is at ' . $nextFullMoon . '. ';
echo PHP_EOL;
echo 'The next new moon is at ' . $next . '. ';

?>
