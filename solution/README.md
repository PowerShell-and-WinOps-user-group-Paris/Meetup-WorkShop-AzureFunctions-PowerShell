# MEETUP 2019-12-12

Based on the [Challenge 11](https://25daysofserverless.com/calendar/11) of the 25 Days of Serverless 2019

We need to handle children's wishes for Xmas and store them in a database for Santa and the elves.
We need to notify elves each time a new wish arrives, and we need a way to request the database.

what do we need to build
* a function to add gift wish to an Azure Storage table via an HTTP post request
* a function to send a message to a Slack Channel each time a new item is added in the table
* a function to query the database

what do we need 
* An Azure Functions App with PowerShell Core runtime
* A Keyvault to store Slack's secret 
* An Azure Storage table to store data and an Azure Storage Queue for message system.

How to build it 
* An HTTP Function to receive Post Request containing the description, username, address and type of present
* An Function with a table trigger to send a request to slack elves channel
* An HTTP Function to request data from the table

The first function, LetterToSanta, receives children’s wishes and put it into an Azure Storage Table. A CosmoDB database will work too. 
As there is no trigger for Azure Storage Table insertion, we need to implement a messaging mechanism so a second function can use the data to send a message to a Slack Channel. 
 To perform that, we can use an Azure Storage Queue. 
The second function, MessageToElve, is triggered by this queue. Each time a message is added to the queue the function run. The code checks the queue message and builds a text message to send to the Slack channel. 
To send the data to Slack, we need to build a Slack application using the incoming webhook model. This will produce an URL like this, https://hooks.slack.com/services/T4JL156KC/XXXX/xxxxxx
As we don’t want this URL to be public in the code or in environment variables. We choose to store it in a KeyVault. To enable access to the vault, we need to enable Managed System Identity on the Functions App and add it to the KeyVault’s access policy. 
Finally, the last function, QueryDatabase, sends the database in a JSON format. 