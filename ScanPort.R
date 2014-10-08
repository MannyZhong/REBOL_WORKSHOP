REBOL [
	title: 测试
]

comment {
repeat n 100 [
    if not error? try [
        read close open probe join tcp://192.168.16.230: n
    ]
    [print [n "is open"]]
]
;load-gui

	view layout [
	    Title "Hello"
	    Btn "OK" []
	]
}

try[
	open probe join tcp://192.168.16.230: 50
]