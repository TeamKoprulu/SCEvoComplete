"" > .\Build.mpq2k
rm ..\Bin\Mods\ -Recurse
mkdir ..\Bin\Mods\ 
ls "..\SC Evo Complete" -Directory | %{

    $filename = $_.Name
    write-host $filename
    

    $src = "../bin/Mods/$($filename)"
    
    "new $src 1000" >>.\Build.mpq2k
    "add $src `"../SC Evo Complete/$($filename)/*`" /r /c" >> .\Build.mpq2k
    "flush $src" >> .\Build.mpq2k
    
}

.\MPQEditor.exe console "Build.mpq2k"