$sourcepred="C:\Users\bunny\Documents\GitHub\Chapter_1\output\maxent\predictions\test-comb\may" #location of starting directory - needs changing
$destcyg = "C:\cygwin64\home\bunny"; #location where files will be copied to
$filterclog = "200305.asc" #CHANGE ME

#move file from the prediction folder to cygwin for editing
Get-ChildItem -Path $sourcepred | Where-Object { $_.Name -match $filterclog } | Copy-Item -Destination $destcyg

#NOW run cygwin script...