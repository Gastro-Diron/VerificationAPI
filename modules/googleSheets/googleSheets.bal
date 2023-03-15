import ballerina/log;
import ballerinax/googleapis.sheets as sheets;

 sheets:ConnectionConfig spreadsheetConfig = {
    auth: {
            clientId: "471759866028-m78a6pekebvk1ebt0vi6c0m8gp7r4riq.apps.googleusercontent.com",
            clientSecret: "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",
            refreshUrl: "https://www.googleapis.com/oauth2/v3/token",
            refreshToken: "1//04QbPUaOoFnyKCgYIARAAGAQSNwF-L9Irmc0G1KY8RhV7NAYADqFmsxgJdZ7SyQJvGoEYgHONOc-uKAjZlyrmuKrQGcUIGE9y6fA"
        }
    // auth: {
    //     token: "ya29.a0AVvZVsocvilTvbia0LBpJllbkcWjyMzg9BuFDVNkUsVX1wd1vJNQvcgelONhp2fLbqDDKznP3hkNBH73vttEfwNnmdC61zUqie5MXLpN7siPvOXflprpf7f_DTpZXS57TlSsoivR7QVtd1AZq2oqHElWlQGcAAj8aCgYKAcYSARASFQGbdwaIgcU_8UXBXm6AE-vc6NF96A0167"}
    // };
 };

    sheets:Client spreadsheetClient = check new (spreadsheetConfig);

public function createSheet() returns error? {
        sheets:Spreadsheet response = check spreadsheetClient->createSpreadsheet("Temporary Database");
        log:printInfo("Successfully created spreadsheet!");
}
// import wso2/googleapis.sheets4;
// import ballerina/config;
// import ballerina/io;

// public function main() {
//     string spreadsheetId = "<your-spreadsheet-id>";
//     string range = "Sheet1!A1:B2";
//     sheets4:ClientConfiguration clientConfig = {
//         oauth2Config: {
//             clientId: config:getAsString("clientId"),
//             clientSecret: config:getAsString("clientSecret"),
//             refreshToken: config:getAsString("refreshToken")
//         }
//     };
//     sheets4:Client sheetsClient = new(clientConfig);
//     sheets4:Sheet sheet = sheetsClient->getSpreadsheetById(spreadsheetId);
//     sheets4:ValueRange valueRange = sheetsClient->getSheetValues(sheet.spreadsheetId, range);
//     io:println(valueRange.toString());
// }