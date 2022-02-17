param($path)

$SuffixTable =@{
    "pss" = "Pissed"
    "dth" = "Death"
    "yes" = "Yes"
    "wht" = "What"
    "rdy" = "Ready"
}
Get-ChildItem "$path/*.wav" | %{
    $id = $_.Directory.Name
    $Suffix = $_.Name -replace "$($_.Extension)",""
    if($_ -match "[a-z]{3}([A-z]{3})([0-9]{2})\.wav"){
        #$matches
        $Suffix = $Matches.1
        if($SuffixTable.Contains($Matches.1)){$Suffix = $SuffixTable[$Matches.1]}
        if($Matches.2){$Num = [int]$Matches.2}
        else{$Num = 0}
    }
    $NewName = ("$($id)_$($suffix){0:d2}$($_.Extension)" -f ($Num))
    [pscustomobject]@{
        "old"=$_.name;
        "new"=$NewName
    }
    Rename-Item -Path $_.FullName -NewName $NewName #-WhatIf
}

