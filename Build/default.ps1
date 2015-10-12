properties {
	$testMessage = 'Executed Test!'
	$compileMessage = 'Executed Compile!'
	$cleanMessage = 'Executed Clean!'

	$outputDirectory = "..\.build"
}

task default -depends Test

task Init -description "Initialises the build by removing previous artifacts and creating output directories" {
	Write-Host "Creating output directory located at ..\.build"
	New-Item "..\.build" -ItemType Directory
}

task Clean -description "Remove temporary files" {
	Write-Host $cleanMessage
}

task Compile -depends Clean -description "Compile the code" {
	Write-Host $compileMessage
}

task Test -depends Compile, Clean -description "Run unit tests" {
	Write-Host $testMessage
}