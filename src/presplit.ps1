$sourcepred="C:\Users\bunny\Documents\GitHub\capelin-variation\output\maxent\predictions\apr_naowint_pos" #location of starting directory - needs changing
$destcyg = "C:\cygwin64\home\bunny"; #location where files will be copied to
$filterclog = "apr_naowint_pos_clogavg_binary.asc" #CHANGE ME

#move file from the prediction folder to cygwin for editing
Get-ChildItem -Path $sourcepred | Where-Object { $_.Name -match $filterclog } | Copy-Item -Destination $destcyg

#NOW run cygwin script...