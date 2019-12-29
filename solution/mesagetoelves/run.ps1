
param([hashtable] $QueueItem, $TriggerMetadata)

try {

    if ($QueueItem.getType().name -eq "Hashtable"){

        $HashSlackMessage = @{
            "text" = "Elves, new request from $($QueueItem.username) who want $($QueueItem.description) $($QueueItem.TypeOfPresent) to be sending to $($QueueItem.address)"
            "username"=  "Elves Bot"
            "icon_emoji"= ":santa:"
        } | ConvertTo-Json 

        

        Invoke-RestMethod -Method Post -Uri $ENV:SlackUri -Body $HashSlackMessage
    }

}
catch {
    Write-Error -Message " Exception Type: $($_.Exception.GetType().FullName) $($_.Exception.Message)"
}



