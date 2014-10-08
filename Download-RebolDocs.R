REBOL[
	title: "Get Documents from the website of official REBOL"
	version: 1.0
	Date: 2014-08-29
]

docs: [  http://www.rebol.com/faq.html
		 http://www.rebol.com/docs/reference.html
		 http://www.rebol.com/r3/docs/functions/repeat.html
	   ]
DocRoot: %/E/TechDocs/REBOL/Reference-Docs

foreach url docs [ 
	url-paths: split-path url
	file-name: url-paths/2
	print ["正在下载文件：" file-name ] 
	write/lines :DocRoot/:file-name read/lines url
	]
