_iTunes Web Interface_

This project is designed to provide a useful iTunes web-interface for casual manipluation
of iTunes throughout a house in order to mitigate having to use remote-desktop or other
bloated solutions.

The current commands available are accessed through rest.

They are implemented using

  where command = "osascript -e 'tell app \"iTunes\" to " ++ argument ++ "'":

* ("play",     "play"),
* ("stop",     "stop"),
* ("pause",    "pause"),
* ("playpause","playpause"),
* ("next",     "next track"),
* ("previous", "previous track"),
* ("up",       "set sound volume to sound volume + 5"),
* ("down",     "set sound volume to sound volume - 5")
