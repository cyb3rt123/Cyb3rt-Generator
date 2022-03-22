$i = 0
while([bool]::Parse('True')){
    $content=(Invoke-webrequest -URI https://opengen.dpkghub.com/api/generate.php?type=NordVPN).Content
    $date = $content.substring($content.indexOf("Expiry = ")+9)
    cls
    if($date.substring(0,3) -ge (Get-Date -Format "yyy-MM-dd"))
    {
        "!!! Compte trouvé !!! (Après "+$i+" essais)"

        return $content
    }
    else {
        "Compte invalide : ("+$i+" essais)"
        $content
    }
    $i++
}
