<# Custom Script for Windows #>
$temploc = "D:\Temp"
If (!(Test-Path $TempLoc)) {
    New-Item $temploc -type directory
}

$contentpayload = "Source.zip"
$contentloc = "C:\"

write-output "Unzip Content Files"
$shell = new-object -com shell.application
$zip = $shell.NameSpace("$temploc\$contentpayload")
foreach($item in $zip.items())
{
    $shell.Namespace("$contentloc").copyhere($item,0x14)
}