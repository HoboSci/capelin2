#set dir
Set-Location "C:\Users\bunny\Documents\GitHub\Chapter_1\data\test\ASCII"

#add yr mth var prefix
Get-ChildItem -Exclude “1998_01_chl__“* | rename-item -NewName { “1998_01_chl__” + $_.Name }


#change layer to m
get-childitem *.asc -Exclude "0.50576.asc"| foreach { rename-item $_ $_.Name.Replace("_1.asc", "0.50576.asc")}
get-childitem *.asc -Exclude "1.55586.asc"| foreach { rename-item $_ $_.Name.Replace("_2.asc", "1.55586.asc")}
get-childitem *.asc -Exclude "2.66768.asc"| foreach { rename-item $_ $_.Name.Replace("_3.asc", "2.66768.asc")}
get-childitem *.asc -Exclude "3.85628.asc"| foreach { rename-item $_ $_.Name.Replace("_4.asc", "3.85628.asc")}
get-childitem *.asc -Exclude "5.14036.asc"| foreach { rename-item $_ $_.Name.Replace("_5.asc", "5.14036.asc")}
get-childitem *.asc -Exclude "6.54303.asc"| foreach { rename-item $_ $_.Name.Replace("_6.asc", "6.54303.asc")}
get-childitem *.asc -Exclude "8.09252.asc"| foreach { rename-item $_ $_.Name.Replace("_7.asc", "8.09252.asc")}
get-childitem *.asc -Exclude "9.82275.asc"| foreach { rename-item $_ $_.Name.Replace("_8.asc", "9.82275.asc")}
get-childitem *.asc -Exclude "11.7737.asc"| foreach { rename-item $_ $_.Name.Replace("_9.asc", "11.7737.asc")}
get-childitem *.asc -Exclude "13.991.asc"| foreach { rename-item $_ $_.Name.Replace("_10.asc", "13.991.asc")}
get-childitem *.asc -Exclude "16.5253.asc"| foreach { rename-item $_ $_.Name.Replace("_11.asc", "16.5253.asc")}
get-childitem *.asc -Exclude "19.4298.asc"| foreach { rename-item $_ $_.Name.Replace("_12.asc", "19.4298.asc")}
get-childitem *.asc -Exclude "22.7576.asc"| foreach { rename-item $_ $_.Name.Replace("_13.asc", "22.7576.asc")}
get-childitem *.asc -Exclude "26.5583.asc"| foreach { rename-item $_ $_.Name.Replace("_14.asc", "26.5583.asc")}
get-childitem *.asc -Exclude "30.8746.asc"| foreach { rename-item $_ $_.Name.Replace("_15.asc", "30.8746.asc")}
get-childitem *.asc -Exclude "35.7402.asc"| foreach { rename-item $_ $_.Name.Replace("_16.asc", "35.7402.asc")}
get-childitem *.asc -Exclude "041.18.asc"| foreach { rename-item $_ $_.Name.Replace("_17.asc", "041.18.asc")}
get-childitem *.asc -Exclude "47.2119.asc"| foreach { rename-item $_ $_.Name.Replace("_18.asc", "47.2119.asc")}
get-childitem *.asc -Exclude "53.8506.asc"| foreach { rename-item $_ $_.Name.Replace("_19.asc", "53.8506.asc")}
get-childitem *.asc -Exclude "61.1128.asc"| foreach { rename-item $_ $_.Name.Replace("_20.asc", "61.1128.asc")}
get-childitem *.asc -Exclude "69.0217.asc"| foreach { rename-item $_ $_.Name.Replace("_21.asc", "69.0217.asc")}
get-childitem *.asc -Exclude "77.6112.asc"| foreach { rename-item $_ $_.Name.Replace("_22.asc", "77.6112.asc")}
get-childitem *.asc -Exclude "86.9294.asc"| foreach { rename-item $_ $_.Name.Replace("_23.asc", "86.9294.asc")}
get-childitem *.asc -Exclude "97.0413.asc"| foreach { rename-item $_ $_.Name.Replace("_24.asc", "97.0413.asc")}
get-childitem *.asc -Exclude "108.03.asc"| foreach { rename-item $_ $_.Name.Replace("_25.asc", "108.03.asc")}
get-childitem *.asc -Exclude "000120.asc"| foreach { rename-item $_ $_.Name.Replace("_26.asc", "000120.asc")}
get-childitem *.asc -Exclude "133.076.asc"| foreach { rename-item $_ $_.Name.Replace("_27.asc", "133.076.asc")}
get-childitem *.asc -Exclude "147.406.asc"| foreach { rename-item $_ $_.Name.Replace("_28.asc", "147.406.asc")}
get-childitem *.asc -Exclude "163.165.asc"| foreach { rename-item $_ $_.Name.Replace("_29.asc", "163.165.asc")}
get-childitem *.asc -Exclude "180.55.asc"| foreach { rename-item $_ $_.Name.Replace("_30.asc", "180.55.asc")}
get-childitem *.asc -Exclude "199.79.asc"| foreach { rename-item $_ $_.Name.Replace("_31.asc", "199.79.asc")}
get-childitem *.asc -Exclude "221.141.asc"| foreach { rename-item $_ $_.Name.Replace("_32.asc", "221.141.asc")}
get-childitem *.asc -Exclude "244.891.asc"| foreach { rename-item $_ $_.Name.Replace("_33.asc", "244.891.asc")}
get-childitem *.asc -Exclude "271.356.asc"| foreach { rename-item $_ $_.Name.Replace("_34.asc", "271.356.asc")}
get-childitem *.asc -Exclude "300.888.asc"| foreach { rename-item $_ $_.Name.Replace("_35.asc", "300.888.asc")}
get-childitem *.asc -Exclude "333.863.asc"| foreach { rename-item $_ $_.Name.Replace("_36.asc", "333.863.asc")}
get-childitem *.asc -Exclude "370.689.asc"| foreach { rename-item $_ $_.Name.Replace("_37.asc", "370.689.asc")}
get-childitem *.asc -Exclude "411.794.asc"| foreach { rename-item $_ $_.Name.Replace("_38.asc", "411.794.asc")}
get-childitem *.asc -Exclude "457.626.asc"| foreach { rename-item $_ $_.Name.Replace("_39.asc", "457.626.asc")}
get-childitem *.asc -Exclude "508.64.asc"| foreach { rename-item $_ $_.Name.Replace("_40.asc", "508.64.asc")}
get-childitem *.asc -Exclude "565.292.asc"| foreach { rename-item $_ $_.Name.Replace("_41.asc", "565.292.asc")}
get-childitem *.asc -Exclude "628.026.asc"| foreach { rename-item $_ $_.Name.Replace("_42.asc", "628.026.asc")}
get-childitem *.asc -Exclude "697.259.asc"| foreach { rename-item $_ $_.Name.Replace("_43.asc", "697.259.asc")}
get-childitem *.asc -Exclude "773.368.asc"| foreach { rename-item $_ $_.Name.Replace("_44.asc", "773.368.asc")}
get-childitem *.asc -Exclude "856.679.asc"| foreach { rename-item $_ $_.Name.Replace("_45.asc", "856.679.asc")}
get-childitem *.asc -Exclude "947.448.asc"| foreach { rename-item $_ $_.Name.Replace("_46.asc", "947.448.asc")}
get-childitem *.asc -Exclude "1045.85.asc"| foreach { rename-item $_ $_.Name.Replace("_47.asc", "1045.85.asc")}
