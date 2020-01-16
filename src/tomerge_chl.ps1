#need to change source folder
#need to change filter

#chl
#o2
#temp
#salinity

$source="C:\Users\bunny\Documents\GitHub\Chapter_1\data\env\ascii-original\ascii2014" #location of starting directory
$dest = "C:\cygwin64\home\bunny\ASCII"; #location where files will be copied to
$filterchl = "2014_10_chl.nc_0.50576.asc"   

$NumArray = (1..47)

#empty the destimation folder
Get-ChildItem -Path C:\cygwin64\home\bunny\ASCII -Include *.* -File -Recurse | foreach { $_.Delete()}


ForEach

($number in $numArray) {

Get-ChildItem -Path $source | Where-Object { $_.Name -match $filterchl }  | `Copy-Item -Destination "C:\cygwin64\home\bunny\ASCII\2014_10_chl.nc_$number.asc" -exclude *prj, *xml

}

