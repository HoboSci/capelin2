#need to change source folder
#need to change filter


#o2
#temp
#salinity

$source="C:\Users\bunny\Documents\GitHub\Chapter_1\data\env\asciitrim\ascii2014" #location of starting directory
$dest = "C:\cygwin64\home\bunny\ASCII"; #location where files will be copied to
$filter = "2014_10_salinity" #  start 0


#empty the destimation folder
Get-ChildItem -Path C:\cygwin64\home\bunny\ASCII -Include *.* -File -Recurse | foreach { $_.Delete()}


#move files

Get-ChildItem -Path $source | Where-Object { $_.Name -match $filter } | Copy-Item -Destination $dest

# remove unwanted files

#1151.99
#1265.86
#1387.38

Remove-Item "C:\cygwin64\home\bunny\ASCII\*1151.99.asc"
Remove-Item "C:\cygwin64\home\bunny\ASCII\*1265.86.asc"
Remove-Item "C:\cygwin64\home\bunny\ASCII\*1387.38.asc"
Remove-Item "C:\cygwin64\home\bunny\ASCII\*370.688.asc" #this is an artifact file
Remove-Item "C:\cygwin64\home\bunny\ASCII\*xml"
Remove-Item "C:\cygwin64\home\bunny\ASCII\*prj"

#rename the files for merging

Set-Location "C:\cygwin64\home\bunny\ASCII"
get-childitem *.asc| foreach { rename-item $_ $_.Name.Replace("0.50576", "101")}
get-childitem *.asc| foreach { rename-item $_ $_.Name.Replace("1.55586", "102")}
get-childitem *.asc| foreach { rename-item $_ $_.Name.Replace("2.66768", "103")}
get-childitem *.asc| foreach { rename-item $_ $_.Name.Replace("3.85628", "104")}
get-childitem *.asc| foreach { rename-item $_ $_.Name.Replace("5.14036", "105")}
get-childitem *.asc| foreach { rename-item $_ $_.Name.Replace("6.54303", "106")}
get-childitem *.asc| foreach { rename-item $_ $_.Name.Replace("8.09252", "107")}
get-childitem *.asc| foreach { rename-item $_ $_.Name.Replace("9.82275", "108")}
get-childitem *.asc| foreach { rename-item $_ $_.Name.Replace("11.7737", "109")}
get-childitem *.asc| foreach { rename-item $_ $_.Name.Replace("13.991", "110")}
get-childitem *.asc| foreach { rename-item $_ $_.Name.Replace("16.5253", "111")}
get-childitem *.asc| foreach { rename-item $_ $_.Name.Replace("19.4298", "112")}
get-childitem *.asc| foreach { rename-item $_ $_.Name.Replace("22.7576", "113")}
get-childitem *.asc| foreach { rename-item $_ $_.Name.Replace("26.5583", "114")}
get-childitem *.asc| foreach { rename-item $_ $_.Name.Replace("30.8746", "115")}
get-childitem *.asc| foreach { rename-item $_ $_.Name.Replace("35.7402", "116")}
get-childitem *.asc| foreach { rename-item $_ $_.Name.Replace("041.18", "117")}
get-childitem *.asc| foreach { rename-item $_ $_.Name.Replace("47.2119", "118")}
get-childitem *.asc| foreach { rename-item $_ $_.Name.Replace("53.8506", "119")}
get-childitem *.asc| foreach { rename-item $_ $_.Name.Replace("61.1128", "120")}
get-childitem *.asc| foreach { rename-item $_ $_.Name.Replace("69.0217", "121")}
get-childitem *.asc| foreach { rename-item $_ $_.Name.Replace("77.6112", "122")}
get-childitem *.asc| foreach { rename-item $_ $_.Name.Replace("86.9294", "123")}
get-childitem *.asc| foreach { rename-item $_ $_.Name.Replace("97.0413", "124")}
get-childitem *.asc| foreach { rename-item $_ $_.Name.Replace("108.03", "125")}
get-childitem *.asc| foreach { rename-item $_ $_.Name.Replace("000120", "126")}
get-childitem *.asc| foreach { rename-item $_ $_.Name.Replace("133.076", "127")}
get-childitem *.asc| foreach { rename-item $_ $_.Name.Replace("147.406", "128")}
get-childitem *.asc| foreach { rename-item $_ $_.Name.Replace("163.165", "129")}
get-childitem *.asc| foreach { rename-item $_ $_.Name.Replace("180.55", "130")}
get-childitem *.asc| foreach { rename-item $_ $_.Name.Replace("199.79", "131")}
get-childitem *.asc| foreach { rename-item $_ $_.Name.Replace("221.141", "132")}
get-childitem *.asc| foreach { rename-item $_ $_.Name.Replace("244.891", "133")}
get-childitem *.asc| foreach { rename-item $_ $_.Name.Replace("271.356", "134")}
get-childitem *.asc| foreach { rename-item $_ $_.Name.Replace("300.888", "135")}
get-childitem *.asc| foreach { rename-item $_ $_.Name.Replace("333.863", "136")}
get-childitem *.asc| foreach { rename-item $_ $_.Name.Replace("370.689", "137")}
get-childitem *.asc| foreach { rename-item $_ $_.Name.Replace("411.794", "138")}
get-childitem *.asc| foreach { rename-item $_ $_.Name.Replace("457.626", "139")}
get-childitem *.asc| foreach { rename-item $_ $_.Name.Replace("508.64", "140")}
get-childitem *.asc| foreach { rename-item $_ $_.Name.Replace("565.292", "141")}
get-childitem *.asc| foreach { rename-item $_ $_.Name.Replace("628.026", "142")}
get-childitem *.asc| foreach { rename-item $_ $_.Name.Replace("697.259", "143")}
get-childitem *.asc| foreach { rename-item $_ $_.Name.Replace("773.368", "144")}
get-childitem *.asc| foreach { rename-item $_ $_.Name.Replace("856.679", "145")}
get-childitem *.asc| foreach { rename-item $_ $_.Name.Replace("947.448", "146")}
get-childitem *.asc| foreach { rename-item $_ $_.Name.Replace("1045.85", "147")}





