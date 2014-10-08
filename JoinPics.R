REBOL[]

img: load %/E/Applications/REBOL/pics/img1.png

for i 2 10 1 [
	tmp: load rejoin [%./pics/img i ".png"]
	append img tmp
]

save/png %img.png img
