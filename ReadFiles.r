REBOL[
	title: "Read and export files from eclipse"
	version:"1.0"
	Date: 2014-08-29
]
data: read %/E/Applications/REBOL/DictDAOTest.java
print read/lines http://www.rebol.com/cgi-bin/save-data.r
load/All save http://www.rebol.com/cgi-bin/save-data.r data

load-gui
view layout [
    bx: box 100x24 black
    button "Red" [bx/color: red  show bx]
    button "Green" [bx/color: green  show bx]
]
