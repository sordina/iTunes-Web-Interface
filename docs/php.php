<?
$q = $_GET['q'];

switch ($q)
{
case "":
echo "You need to send me a command, then I shall execute it";
break;

case "play";
exec("osascript -e 'tell app \"iTunes\" to play'");
echo "Playing";
break;

case "pause";
exec("osascript -e 'tell app \"iTunes\" to pause'");
echo "Pausing";
break;

case "playpause";
exec("osascript -e 'tell app \"iTunes\" to playpause'");
echo "Toggling Play";
break;

case "next";
exec("osascript -e 'tell app \"iTunes\" to next track'");
echo "Next Track";
break;

case "prev";
exec("osascript -e 'tell app \"iTunes\" to previous track'");
echo "Previous Track";
break;

case "louder";
exec("osascript -e 'tell app \"iTunes\" to set sound volume to sound volume + 5'");
echo "Turning Up the Volume";
break;

case "quieter";
exec("osascript -e 'tell app \"iTunes\" to set sound volume to sound volume - 5'");
echo "Turning Down the Volume";
break;

case "mute";
mutev();
echo "Muting the Volume";
break;
}


function mutev()
{
echo "start mute function<br>";

$data = file_get_contents("/webfolder/volume.txt");

$logfile = fopen("/webfolder/volume.txt",'w');

$oldvolume = exec("osascript -e 'tell app \"iTunes\" to sound volume'");

echo "volume data:$data:<br>";
if ($data == "x")
{
fwrite($logfile,$oldvolume);
exec("osascript -e 'tell app \"iTunes\" to set sound volume to 0'");
}
else
{
fwrite($logfile,"x");
exec("osascript -e 'tell app \"iTunes\" to set sound volume to $data'");
}
fclose($logfile);
}

?>
