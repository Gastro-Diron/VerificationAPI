// import VerificationAPI.formatData;
import ballerina/http;
import ballerinax/googleapis.sheets;
import VerificationAPI.googleSheets;
// import ballerina/io;
// import VerificationAPI.email;

// string scope = "internal_user_mgt_create";
// string orgname = "orgwso2";

// configurable string clientID = io:readln("Enter the ClientID of your Asgardeo Application:");
// configurable string clientSecret = io:readln("Enter the ClientSecret of your Asgardeo Application:");

http:Client Register = check new ("https://api.asgardeo.io/t/orgwso2/scim2", httpVersion = http:HTTP_1_1);

service / on new http:Listener (9091){

    resource function get verify() returns string[][]|error?|VerifyEntry[] {
        return verifyTable.toArray();
    }
    
    resource function post verify (@http:Payload VerifyEntry verifyEntry) returns VerifyEntry|string|error|ConflictingEmailsError {
        boolean conflictingEmail = verifyTable.hasKey(verifyEntry.email);
        sheets:Row data = check googleSheets:getData();
        int|string|decimal code = data.values[0];
        string verificationCode;
        verifyTable.add(verifyEntry);

        if code is string{
            verificationCode = code;
        } else{
            verificationCode = "1234";
        }


        if conflictingEmail {
            return {
                body: {
                    errmsg: string:'join(" ", "Conflicting emails:"+verifyEntry.email)
                }
            };
        } else {
            // if verifyEntry.code == verificationCode {
            //     //json Msg = formatData:formatdata(data.values[2],data.values[1]);

            //     //error? success = email:success(verifyEntry.email);

            //     //json token = check makeRequest(orgname,clientID,clientSecret);
            //     //json token_type_any = check token.token_type;
            //     //json access_token_any = check token.access_token;
            //     // string token_type = token_type_any.toString();
            //     // string access_token = access_token_any.toString();
            //     // http:Response|http:ClientError postData = check Register->post(path = "/Users", message = Msg, headers = {"Authorization": token_type+" "+access_token, "Content-Type": "application/scim+json"});
            //     // if postData is http:Response {
            //     //     int num = postData.statusCode;
            //     //     return "The code is correct";
            //     // } else {
            //     //     return "The code is correct but error in creating the user";
            //     // }
            //     return "Code is Valid";

            // } else {
            //     //error? success = email:failure(verifyEntry.email);
            //     return "Code is Invalid";
            // }
            return verifyEntry;
        }
    }

    resource function get verify/[string email] () returns string|InvalidEmailError|VerifyEntry?|error {
        VerifyEntry? verifyEntry = verifyTable[email];
        // sheets:Row data = check googleSheets:getData();
        // int|string|decimal code = data.values[0];
        // string verificationCode;

        // if code is string{
        //     verificationCode = code;
        // } else{
        //     verificationCode = "1234";
        // }

        if verifyEntry is () {
            return {
                body: {
                    errmsg: string `Invalid Email: ${email}`
                }
            };
        } else{
            // if verifyEntry.code == verificationCode {
            //     json Msg = formatData:formatdata(data.values[2],data.values[1]);

            //     error? success = email:success(verifyEntry.email);

            //     json token = check makeRequest(orgname,clientID,clientSecret);
            //     json token_type_any = check token.token_type;
            //     json access_token_any = check token.access_token;
            //     string token_type = token_type_any.toString();
            //     string access_token = access_token_any.toString();
            //     http:Response|http:ClientError postData = check Register->post(path = "/Users", message = Msg, headers = {"Authorization": token_type+" "+access_token, "Content-Type": "application/scim+json"});
            //     if postData is http:Response {
            //         int num = postData.statusCode;
            //         return "The code is correct";
            //     } else {
            //         return "The code is correct but error in creating the user";
            //     }

            // } else {
            //     error? success = email:failure(verifyEntry.email);
            //     return "Invalid Code";
            // }
            return verifyEntry;
        }
    }
}

public type ConflictingEmailsError record {|
    *http:Conflict;
    ErrorMsg body;
|};

public type ErrorMsg record {|
    string errmsg;
|};

public type InvalidEmailError record {|
    *http:NotFound;
    ErrorMsg body;
|};

public type VerifyEntry record {|
    readonly string email;
    string code;
|};

public final table <VerifyEntry> key(email) verifyTable = table [];

// public function makeRequest(string orgName, string clientId, string clientSecret) returns json|error|error {
//     http:Client clientEP = check new ("https://api.asgardeo.io",
//         auth = {
//             username: clientId,
//             password: clientSecret
//         },
//          httpVersion = http:HTTP_1_1
//     );
//     http:Request req = new;
//     req.setPayload("grant_type=client_credentials&scope="+scope, "application/x-www-form-urlencoded");
//     http:Response response = check clientEP->/t/[orgName]/oauth2/token.post(req);
//     io:println("Got response with status code: ", response.statusCode);
//     io:println(response.getJsonPayload());
//     json tokenInfo = check response.getJsonPayload();
//     return tokenInfo;
// }