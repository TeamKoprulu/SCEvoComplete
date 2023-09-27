$7zbin = "C:\Program Files\7-Zip\7z.exe"
$targetname = "SCEvo_CoreMods_0_13.zip"
rm ..\Bin\Zip -recurse
mkdir ..\Bin\Zip
ls ..\Bin\Mods\*.SC2Mod -Recurse | %{
$filename = $_.name
& $7zbin "a" ..\Bin\Zip\$($targetname) $_.FullName  #| Out-Null
& $7zbin "rn" ..\Bin\Zip\$($targetname) $filename "Mods/SC Evolution Complete/$($filename)" #| Out-Null
}
