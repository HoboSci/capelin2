$source="C:\Users\bunny\Documents\GitHub\Chapter_1\data\env\ascii\ascii1998" #location of starting directory
$dest = "C:\cygwin64\home\bunny\ASCII"; #location where files will be copied to
$filter = "1998_01_chl"
Get-ChildItem -Path $source | Where-Object { $_.Name -match $filter } | Copy-Item -Destination $dest

# remove unwanted files

#1151.99
#1265.86
#1387.38

Remove-Item "C:\cygwin64\home\bunny\ASCII\*1151.99.asc"\
Remove-Item "C:\cygwin64\home\bunny\ASCII\*1265.86.asc"\
Remove-Item "C:\cygwin64\home\bunny\ASCII\*1387.38.asc"\