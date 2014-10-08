REBOL[
	Title: "Export amendment files"
	Date: "2014-10-08"
	Version: 0.1
	Author: 'Manny Zhong'
]

amendFileList: %/F\MPCG-Projects\TAS-MP\TTAS-MP\MPTAS\Release\R20141008\AmendList.txt
rootPath: %/E\Projects\MP-TAS
targetDir: %/F\MPCG-Projects\TAS-MP\TTAS-MP\MPTAS\Release\R20141008\Src
classesDir: %/E\Projects\MP-TAS\ess2\WebRoot\WEB-INF\classes

filePaths: read/lines amendFileList

foreach item filePaths
[
	;print (not find item "--")
	either (length? item)  > 0 and (not find item "--") 
	[
		index1: index? find/last item "/"
		fileName: find/last item "/"
		fileFolder: copy/part at item 0 index1
		;print join "file folder:" fileFolder
		sourceFile: rejoin [rootPath item] 
		;print fileName
		
		if find/last fileName ".java"
		[
			;Rebol is pass by reference, not by value.So copy it
			item2: copy/deep at item 0 length? item
			
			classPath: replace item2 ".java" ".class"
			classPath: replace classPath "/ess2/src/main/java" ""
			
			sourceClass: rejoin [classesDir classPath]
			
			targetClassesDir: rejoin [targetDir "\ess2\WebRoot\WEB-INF\classes"]
			
			index2: index? find/last classPath "/"
			className: find/last classPath "/"
			classFolder: copy/part at classPath 0 index2
		
			tarClassPath: rejoin [targetClassesDir classFolder]
			
			if not exists? tarClassPath [make-dir/deep tarClassPath]
			
			classData: read/binary sourceClass
			write/binary rejoin [targetClassesDir classPath] classData
		]
		
		targetFolder: rejoin [targetDir fileFolder]
		
		;print dir? targetFolder
		if not exists? targetFolder [make-dir/deep targetFolder]
		print targetFolder
		
		targetFile: join targetDir item
		
		fileData: read/binary sourceFile
		write/binary targetFile fileData
	]
	[]
]