on writeToFile(filename, filecontents)
	set the output to open for access file filename with write permission
	set eof of the output to 0
	write filecontents to the output starting at eof
	close access the output
end writeToFile

tell application "Notes"
	activate
	display dialog "All notes will be exported as HTML files at your Desktop." with title "Export Notes"
	repeat with each in every note
		set noteName to name of each
		set noteBody to body of each
		set filename to (((path to desktop folder) as string) & noteName & ".html")
		my writeToFile(filename, noteBody as text)
	end repeat
end tell
