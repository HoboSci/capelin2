#need to change source folder
#need to change filter

#chl
#o2
#temp
#salinity

$source="C:\Users\bunny\Documents\GitHub\Chapter_1\data\env\ascii\ascii2001" #location of starting directory
$dest = "C:\cygwin64\home\bunny\ASCII"; #location where files will be copied to
$filter = "2001_09_o2" # 2001 - 2003 + 2009 all but aug salinity up

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

#rename the files for merging

Set-Location "C:\cygwin64\home\bunny\ASCII"
get-childitem *.asc| foreach { rename-item $_ $_.Name.Replace("0.50576", "1")}
get-childitem *.asc| foreach { rename-item $_ $_.Name.Replace("1.55586", "2")}
get-childitem *.asc| foreach { rename-item $_ $_.Name.Replace("2.66768", "3")}
get-childitem *.asc| foreach { rename-item $_ $_.Name.Replace("3.85628", "4")}
get-childitem *.asc| foreach { rename-item $_ $_.Name.Replace("5.14036", "5")}
get-childitem *.asc| foreach { rename-item $_ $_.Name.Replace("6.54303", "6")}
get-childitem *.asc| foreach { rename-item $_ $_.Name.Replace("8.09252", "7")}
get-childitem *.asc| foreach { rename-item $_ $_.Name.Replace("9.82275", "8")}
get-childitem *.asc| foreach { rename-item $_ $_.Name.Replace("11.7737", "9")}
get-childitem *.asc| foreach { rename-item $_ $_.Name.Replace("13.991", "10")}
get-childitem *.asc| foreach { rename-item $_ $_.Name.Replace("16.5253", "11")}
get-childitem *.asc| foreach { rename-item $_ $_.Name.Replace("19.4298", "12")}
get-childitem *.asc| foreach { rename-item $_ $_.Name.Replace("22.7576", "13")}
get-childitem *.asc| foreach { rename-item $_ $_.Name.Replace("26.5583", "14")}
get-childitem *.asc| foreach { rename-item $_ $_.Name.Replace("30.8746", "15")}
get-childitem *.asc| foreach { rename-item $_ $_.Name.Replace("35.7402", "16")}
get-childitem *.asc| foreach { rename-item $_ $_.Name.Replace("041.18", "17")}
get-childitem *.asc| foreach { rename-item $_ $_.Name.Replace("47.2119", "18")}
get-childitem *.asc| foreach { rename-item $_ $_.Name.Replace("53.8506", "19")}
get-childitem *.asc| foreach { rename-item $_ $_.Name.Replace("61.1128", "20")}
get-childitem *.asc| foreach { rename-item $_ $_.Name.Replace("69.0217", "21")}
get-childitem *.asc| foreach { rename-item $_ $_.Name.Replace("77.6112", "22")}
get-childitem *.asc| foreach { rename-item $_ $_.Name.Replace("86.9294", "23")}
get-childitem *.asc| foreach { rename-item $_ $_.Name.Replace("97.0413", "24")}
get-childitem *.asc| foreach { rename-item $_ $_.Name.Replace("108.03", "25")}
get-childitem *.asc| foreach { rename-item $_ $_.Name.Replace("000120", "26")}
get-childitem *.asc| foreach { rename-item $_ $_.Name.Replace("133.076", "27")}
get-childitem *.asc| foreach { rename-item $_ $_.Name.Replace("147.406", "28")}
get-childitem *.asc| foreach { rename-item $_ $_.Name.Replace("163.165", "29")}
get-childitem *.asc| foreach { rename-item $_ $_.Name.Replace("180.55", "30")}
get-childitem *.asc| foreach { rename-item $_ $_.Name.Replace("199.79", "31")}
get-childitem *.asc| foreach { rename-item $_ $_.Name.Replace("221.141", "32")}
get-childitem *.asc| foreach { rename-item $_ $_.Name.Replace("244.891", "33")}
get-childitem *.asc| foreach { rename-item $_ $_.Name.Replace("271.356", "34")}
get-childitem *.asc| foreach { rename-item $_ $_.Name.Replace("300.888", "35")}
get-childitem *.asc| foreach { rename-item $_ $_.Name.Replace("333.863", "36")}
get-childitem *.asc| foreach { rename-item $_ $_.Name.Replace("370.689", "37")}
get-childitem *.asc| foreach { rename-item $_ $_.Name.Replace("411.794", "38")}
get-childitem *.asc| foreach { rename-item $_ $_.Name.Replace("457.626", "39")}
get-childitem *.asc| foreach { rename-item $_ $_.Name.Replace("508.64", "40")}
get-childitem *.asc| foreach { rename-item $_ $_.Name.Replace("565.292", "41")}
get-childitem *.asc| foreach { rename-item $_ $_.Name.Replace("628.026", "42")}
get-childitem *.asc| foreach { rename-item $_ $_.Name.Replace("697.259", "43")}
get-childitem *.asc| foreach { rename-item $_ $_.Name.Replace("773.368", "44")}
get-childitem *.asc| foreach { rename-item $_ $_.Name.Replace("856.679", "45")}
get-childitem *.asc| foreach { rename-item $_ $_.Name.Replace("947.448", "46")}
get-childitem *.asc| foreach { rename-item $_ $_.Name.Replace("1045.85", "47")}

Remove-Item "C:\cygwin64\home\bunny\ASCII\*370.688.asc"
Remove-Item "C:\cygwin64\home\bunny\ASCII\*xml"
Remove-Item "C:\cygwin64\home\bunny\ASCII\*prj"