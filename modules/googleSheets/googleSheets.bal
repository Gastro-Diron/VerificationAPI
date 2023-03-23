import ballerinax/googleapis.sheets as sheets;
import ballerina/io;

configurable string sheetClientID = io:readln("Enter the ClientID of your GoogleSheetAPI:");
configurable string sheetClientSecret = io:readln("Enter the ClientSecret of your GoogleSheetAPI:");
configurable string sheetRefreshToken = io:readln("Enter the RefreshToken of your GoogleSheetAPI:");
configurable string sheetID = io:readln("Enter the spreadsheetID:");

sheets:ConnectionConfig spreadsheetConfig = {
    auth: {
            clientId: sheetClientID,
            clientSecret: sheetClientSecret,
            refreshUrl: "https://www.googleapis.com/oauth2/v3/token",
            refreshToken: sheetRefreshToken
        }
 };

sheets:Client spreadsheetClient = check new (spreadsheetConfig);

public function getData() returns error|sheets:Row {
        sheets:Row|error openRes = check spreadsheetClient->getRow(sheetID,"Sheet1",1);
        return openRes;
}