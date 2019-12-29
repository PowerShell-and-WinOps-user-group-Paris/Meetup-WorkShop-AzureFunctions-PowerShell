using namespace System.Net


param($Request, $TriggerMetadata)



try {

    $ItemType = $Request.Query.ItemType

    $FunctionStorageConfigHash = ConvertFrom-StringData -StringData $ENV:AzureWebJobsStorage.Replace(";","`r`n")

    $ctx = New-AzStorageContext -StorageAccountName $FunctionStorageConfigHash.AccountName -StorageAccountKey $FunctionStorageConfigHash.AccountKey

    $cloudTable = (Get-AzStorageTable -Name "foodlist" -Context $ctx).CloudTable    

    if (-not $ItemType) {
        $data = Get-AzTableRow -table $cloudTable -PartitionKey gift | ConvertTo-Json
    }
    else {
        $data = Get-AzTableRow -table $cloudTable -PartitionKey gift -columnName "typeofpresent" -value $ItemType -operator Equal | ConvertTo-Json
    }


    $HttpResponse = [HttpResponseContext]@{ 
        StatusCode = [HttpStatusCode]::OK
        Body = $data
    }   



}
catch {

        $HttpResponse = [HttpResponseContext]@{ 
            StatusCode = [HttpStatusCode]::InternalServerError
            Body = "Error while processing the request"
        } 
        Write-Error -Message " Exception Type: $($_.Exception.GetType().FullName) $($_.Exception.Message)"
}
finally {
        Push-OutputBinding -Name Response -Value $HttpResponse 
}
