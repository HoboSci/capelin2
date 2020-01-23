#this is for after bash... separate.sh file run

#set up for moving below...
$source="C:\cygwin64\home\bunny" #location of starting directory
$dest = "C:\cygwin64\home\bunny\output"; #location where files will be copied to
$filter = ".asc" 

$sourceout="C:\cygwin64\home\bunny\output" #location of starting directory
$destsplit = "C:\Users\bunny\Documents\GitHub\Chapter_1\output\maxent\predictions\com-split\dec"; #location where files will be copied to #CHANGE HERE
$filtercom = ".asc" 

$yearmonth = "cloglog_2011_12_" #CHANGE ME



#move files into the output folder for manipulation
Get-ChildItem -Path $source | Where-Object { $_.Name -match $filter } | Copy-Item  -Destination $dest -Exclude cloglog_*

#set dir for edititng
Set-Location "C:\cygwin64\home\bunny\output"

#add yr mth var prefix
Get-ChildItem -Exclude $yearmonth | rename-item -NewName { $yearmonth + $_.Name } 

#change layer to m
get-childitem *.asc -Exclude "0.50576.asc"| foreach { rename-item $_ $_.Name.Replace("_1.asc", "_0.50576.asc")}
get-childitem *.asc -Exclude "1.55586.asc"| foreach { rename-item $_ $_.Name.Replace("_2.asc", "_1.55586.asc")}
get-childitem *.asc -Exclude "2.66768.asc"| foreach { rename-item $_ $_.Name.Replace("_3.asc", "_2.66768.asc")}
get-childitem *.asc -Exclude "3.85628.asc"| foreach { rename-item $_ $_.Name.Replace("_4.asc", "_3.85628.asc")}
get-childitem *.asc -Exclude "5.14036.asc"| foreach { rename-item $_ $_.Name.Replace("_5.asc", "_5.14036.asc")}
get-childitem *.asc -Exclude "6.54303.asc"| foreach { rename-item $_ $_.Name.Replace("_6.asc", "_6.54303.asc")}
get-childitem *.asc -Exclude "8.09252.asc"| foreach { rename-item $_ $_.Name.Replace("_7.asc", "_8.09252.asc")}
get-childitem *.asc -Exclude "9.82275.asc"| foreach { rename-item $_ $_.Name.Replace("_8.asc", "_9.82275.asc")}
get-childitem *.asc -Exclude "11.7737.asc"| foreach { rename-item $_ $_.Name.Replace("_9.asc", "_11.7737.asc")}
get-childitem *.asc -Exclude "13.991.asc"| foreach { rename-item $_ $_.Name.Replace("_10.asc", "_13.991.asc")}
get-childitem *.asc -Exclude "16.5253.asc"| foreach { rename-item $_ $_.Name.Replace("_11.asc", "_16.5253.asc")}
get-childitem *.asc -Exclude "19.4298.asc"| foreach { rename-item $_ $_.Name.Replace("_12.asc", "_19.4298.asc")}
get-childitem *.asc -Exclude "22.7576.asc"| foreach { rename-item $_ $_.Name.Replace("_13.asc", "_22.7576.asc")}
get-childitem *.asc -Exclude "26.5583.asc"| foreach { rename-item $_ $_.Name.Replace("_14.asc", "_26.5583.asc")}
get-childitem *.asc -Exclude "30.8746.asc"| foreach { rename-item $_ $_.Name.Replace("_15.asc", "_30.8746.asc")}
get-childitem *.asc -Exclude "35.7402.asc"| foreach { rename-item $_ $_.Name.Replace("_16.asc", "_35.7402.asc")}
get-childitem *.asc -Exclude "041.18.asc"| foreach { rename-item $_ $_.Name.Replace("_17.asc", "_041.18.asc")}
get-childitem *.asc -Exclude "47.2119.asc"| foreach { rename-item $_ $_.Name.Replace("_18.asc", "_47.2119.asc")}
get-childitem *.asc -Exclude "53.8506.asc"| foreach { rename-item $_ $_.Name.Replace("_19.asc", "_53.8506.asc")}
get-childitem *.asc -Exclude "61.1128.asc"| foreach { rename-item $_ $_.Name.Replace("_20.asc", "_61.1128.asc")}
get-childitem *.asc -Exclude "69.0217.asc"| foreach { rename-item $_ $_.Name.Replace("_21.asc", "_69.0217.asc")}
get-childitem *.asc -Exclude "77.6112.asc"| foreach { rename-item $_ $_.Name.Replace("_22.asc", "_77.6112.asc")}
get-childitem *.asc -Exclude "86.9294.asc"| foreach { rename-item $_ $_.Name.Replace("_23.asc", "_86.9294.asc")}
get-childitem *.asc -Exclude "97.0413.asc"| foreach { rename-item $_ $_.Name.Replace("_24.asc", "_97.0413.asc")}
get-childitem *.asc -Exclude "108.03.asc"| foreach { rename-item $_ $_.Name.Replace("_25.asc", "_108.03.asc")}
get-childitem *.asc -Exclude "000120.asc"| foreach { rename-item $_ $_.Name.Replace("_26.asc", "_000120.asc")}
get-childitem *.asc -Exclude "133.076.asc"| foreach { rename-item $_ $_.Name.Replace("_27.asc", "_133.076.asc")}
get-childitem *.asc -Exclude "147.406.asc"| foreach { rename-item $_ $_.Name.Replace("_28.asc", "_147.406.asc")}
get-childitem *.asc -Exclude "163.165.asc"| foreach { rename-item $_ $_.Name.Replace("_29.asc", "_163.165.asc")}
get-childitem *.asc -Exclude "180.55.asc"| foreach { rename-item $_ $_.Name.Replace("_30.asc", "_180.55.asc")}
get-childitem *.asc -Exclude "199.79.asc"| foreach { rename-item $_ $_.Name.Replace("_31.asc", "_199.79.asc")}
get-childitem *.asc -Exclude "221.141.asc"| foreach { rename-item $_ $_.Name.Replace("_32.asc", "_221.141.asc")}
get-childitem *.asc -Exclude "244.891.asc"| foreach { rename-item $_ $_.Name.Replace("_33.asc", "_244.891.asc")}
get-childitem *.asc -Exclude "271.356.asc"| foreach { rename-item $_ $_.Name.Replace("_34.asc", "_271.356.asc")}
get-childitem *.asc -Exclude "300.888.asc"| foreach { rename-item $_ $_.Name.Replace("_35.asc", "_300.888.asc")}
get-childitem *.asc -Exclude "333.863.asc"| foreach { rename-item $_ $_.Name.Replace("_36.asc", "_333.863.asc")}
get-childitem *.asc -Exclude "370.689.asc"| foreach { rename-item $_ $_.Name.Replace("_37.asc", "_370.689.asc")}
get-childitem *.asc -Exclude "411.794.asc"| foreach { rename-item $_ $_.Name.Replace("_38.asc", "_411.794.asc")}
get-childitem *.asc -Exclude "457.626.asc"| foreach { rename-item $_ $_.Name.Replace("_39.asc", "_457.626.asc")}
get-childitem *.asc -Exclude "508.64.asc"| foreach { rename-item $_ $_.Name.Replace("_40.asc", "_508.64.asc")}
get-childitem *.asc -Exclude "565.292.asc"| foreach { rename-item $_ $_.Name.Replace("_41.asc", "_565.292.asc")}
get-childitem *.asc -Exclude "628.026.asc"| foreach { rename-item $_ $_.Name.Replace("_42.asc", "_628.026.asc")}
get-childitem *.asc -Exclude "697.259.asc"| foreach { rename-item $_ $_.Name.Replace("_43.asc", "_697.259.asc")}
get-childitem *.asc -Exclude "773.368.asc"| foreach { rename-item $_ $_.Name.Replace("_44.asc", "_773.368.asc")}
get-childitem *.asc -Exclude "856.679.asc"| foreach { rename-item $_ $_.Name.Replace("_45.asc", "_856.679.asc")}
get-childitem *.asc -Exclude "947.448.asc"| foreach { rename-item $_ $_.Name.Replace("_46.asc", "_947.448.asc")}
get-childitem *.asc -Exclude "1045.85.asc"| foreach { rename-item $_ $_.Name.Replace("_47.asc", "_1045.85.asc")}


#move files

Get-ChildItem -Path $sourceout | Where-Object { $_.Name -match $filtercom } | Copy-Item -Destination $destsplit

#empty the source folder and the home folder (just .asc files)
Get-ChildItem -Path C:\cygwin64\home\bunny\output\ -Include *.* -File -Recurse | foreach { $_.Delete()}
Get-ChildItem -Path C:\cygwin64\home\bunny\ -Include *.asc* -File -Recurse | foreach { $_.Delete()}