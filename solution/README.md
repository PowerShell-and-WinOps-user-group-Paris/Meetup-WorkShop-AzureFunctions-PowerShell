# MEETUP 2019-12-12

Based on the [Challenge 11](https://25daysofserverless.com/calendar/11) of the 25 Days of Serverless 2019

We need to handle children Gift wish and store them
We need to notify elves each time a new wish arrive
We need a a way to request the database 

what do we need to build
* a function to add gift wish to an Azure Storage table via an HTTP post request
* a function to send a message to a Slack Channel each time a new item is added in the table
* a function to query the database


what do we need 
* An Azure Functions App with PowerShell Core runtime
* A Keyvault to store token to slack
* Blob container to store data and a TableStorage 

How to build it 
* An HTTP Function to receive Post Request containing description,username,address and type of present
* An Function with a table trigger to send request to slack elves channel
* An HTTP Function to request data from the table

