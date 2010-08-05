iTunes Web Interface
--------------------

This project is designed to provide a useful iTunes web-interface for casual manipluation
of iTunes throughout a house in order to mitigate having to use remote-desktop or other
bloated solutions.

The current commands available are accessed through rest.

They are implemented using _osascript -e 'tell app "iTunes" to ..._

* ("play",     "play"),
* ("stop",     "stop"),
* ("pause",    "pause"),
* ("playpause","playpause"),
* ("next",     "next track"),
* ("previous", "previous track"),
* ("up",       "set sound volume to sound volume + 5"),
* ("down",     "set sound volume to sound volume - 5")

_This project bases iTunes control commands on the scripts found at http://forum.micasaverde.com/index.php?topic=3895.0_
