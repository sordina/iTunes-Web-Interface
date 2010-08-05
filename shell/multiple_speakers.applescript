activate application "iTunes"
tell application "System Events"
	tell application process "iTunes"
		
		if (name of button 16 of window "iTunes" as text) ≠ "" then
			click button 16 of window "iTunes" --Press the iTunes Speaker Button
			delay 0.01
			-- Traverse down the list of speakears (up to 7) -- If you have MORE than 6 airport Express units, make this a larger number to accomodate.
			repeat with i from 1 to 7
				key code 125
			end repeat
			keystroke return
			repeat with i from 1 to (count of every UI element of window 1)
				tell UI element i of window "Multiple Speakers"
					
					set rowcount to count of rows
					if rowcount > 0 then -- Do we have Speakers available? 
						
						-- Note that if your list of speakers changes at any point (due to an airport express being powered off, etc) the selection by row # will break. 
						-- If you rename them, changing their alphabetical order, you will be turning on the wrong speaker. 
						-- This logic needs to be fixed by someone who knows iTunes scripting better than I do. 
						
						-- Turn on the Kitchen Speaker (row 2) if it is off
						if (value of checkbox 1 of row 2) as integer = 0 then
							click checkbox 1 of row 2
						end if
						
						-- Turn on Living Room Speaker (row 1) also, if it is off.
						if (value of checkbox 1 of row 1) as integer = 0 then
							click checkbox 1 of row 1
						end if
						
						-- Now that we have enabled another speaker (satisfying iTunes), we can shut off the computer speakers
						if (value of checkbox 1 of row 5) as integer = 1 then
							click checkbox 1 of row 5
						end if
						
						
					end if
					
				end tell
			end repeat
			
			
		end if
		
	end tell
end tell
