# powershell.exe -ExecutionPolicy ByPass -NoExit -Command "& 'C:\Users\partho\Anaconda3\shell\condabin\conda-hook.ps1' ; conda activate 'C:\Users\partho\Anaconda3' ; cd d:\src\gh\bdhrs-wf"
# & 'C:\Users\partho\Anaconda3\shell\condabin\conda-hook.ps1' ; conda activate 'C:\Users\partho\Anaconda3' ; cd d:\src\gh\bdhrs-wf
#
# conda create --name bodhirasa python=3.7.2
# conda install pandas nltk matplotlib seaborn jupyter
# conda activate bodhirasa

$rootFolder = $PSScriptRoot
$suttaName = "mn" # "an", "dn", "sn", "mn"
$corpusRoot = "D:\src\gh\sc\bilara-data\root\pli\ms\sutta\$suttaName"
$suttaText = "$rootFolder\corpus\$suttaName.txt"

Get-ChildItem -rec -filt * -file $corpusRoot | ForEach-Object {
  $json = Get-Content $_.FullName -Encoding UTF8 | ConvertFrom-Json
  $json | Get-Member -MemberType NoteProperty | ForEach-Object {
    $json.($_.Name)
  }
} >$suttaText
