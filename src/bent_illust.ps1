#need to change source folder
#need to change filter


#o2
#temp
#salinity

$source="C:\Users\bunny\Documents\GitHub\Chapter_1\output\maxent\paper_plots\bent_illus\sal" #location of starting directory
$dest = "C:\cygwin64\home\bunny\ASCII"; #location where files will be copied to
$filter = "salinity" #  start 0


#empty the destimation folder
Get-ChildItem -Path C:\cygwin64\home\bunny\ASCII -Include *.* -File -Recurse | foreach { $_.Delete()}


#move files

Get-ChildItem -Path $source | Where-Object { $_.Name -match $filter } | Copy-Item -Destination $dest


#rename the files for merging

Set-Location "C:\cygwin64\home\bunny\ASCII"
get-childitem *.asc| foreach { rename-item $_ $_.Name.Replace("9.82275", "101")}
get-childitem *.asc| foreach { rename-item $_ $_.Name.Replace("221.141", "102")}
get-childitem *.asc| foreach { rename-item $_ $_.Name.Replace("508.64", "103")}






