using namespace System.Net

param($Request, $TriggerMetadata)


try {
    # Verify the request 
    if (($null -ne $Request.Body.Description) `
    -AND ($null -ne $Request.Body.username) `
        -AND ($null -ne $Request.Body.address) `
            -AND ($null -ne $Request.Body.TypeOfPresent)) {


        $RowKey = (new-guid).guid 
                    $WishData = @{ 
                        "username" = $Request.Body.username
                        "description" = $Request.Body.Description
                        "address" = $Request.Body.address
                        "TypeOfPresent" = $Request.Body.TypeOfPresent
                    }


        Push-OutputBinding -Name elvesqueue -Value $WishData 

        $WishData.Add("partitionKey",  "gift")   
        $WishData.Add("rowKey",  $RowKey)        


        Push-OutputBinding -Name outputTable -Value $WishData

        $HttpResponse = [HttpResponseContext]@{ 
            StatusCode = [HttpStatusCode]::OK
            Body = "Hello $($Request.Body.username) Santa will read your letter soon"
           }  

    }

    else {
        $HttpResponse = [HttpResponseContext]@{ 
            StatusCode = [HttpStatusCode]::BadRequest
            Body = "Please pass an Username, a Description, an address and a type of present in the request body."
           } 
    }

}
catch {
    $HttpResponse = [HttpResponseContext]@{ 
        StatusCode = [HttpStatusCode]::InternalServerError
        Body = "Something Bad Happen, elves are working on this issue, try again later"
       } 
}
finally {
    # Associate values to output bindings by calling 'Push-OutputBinding'.
    Push-OutputBinding -Name Response -Value $HttpResponse
}



