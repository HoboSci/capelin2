﻿#need to change source folder
#need to change filter

#01_amowinter_01
#01_naowinter_01

#naoprev_01
#naosample_01
#amosample_01
#chl.nc_0.50576

$source="C:\Users\bunny\Documents\GitHub\Chapter_1\data\env\asciitrim\ascii2008" #location of starting directory
$dest = "C:\cygwin64\home\bunny\ASCII"; #location where files will be copied to
$filterchl = "06_naoprev_01.asc"   

$NumArray = (1..47)

#empty the destimation folder
Get-ChildItem -Path C:\cygwin64\home\bunny\ASCII -Include *.* -File -Recurse | foreach { $_.Delete()}


ForEach

($number in $numArray) {

Get-ChildItem -Path $source | Where-Object { $_.Name -match $filterchl }  | `Copy-Item -Destination "C:\cygwin64\home\bunny\ASCII\a_$number.asc" -exclude *prj, *xml

}

# then combine.sh