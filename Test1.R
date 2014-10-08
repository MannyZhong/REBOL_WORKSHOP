REBOL [Title: "Example script"]

view layout [text "Hello REBOL World!"]

foreach file read %./ [print [file size? file]]


REBOL [Title: "Example CGI script"]
print "Content-Type: text/html^/"
print [<html><body><pre> system/options </pre></body></html>]