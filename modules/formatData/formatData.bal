public function formatdata (int|string|decimal name, int|string|decimal email) returns json{
    
    string actualEmail;
    if email is string {
        actualEmail = email;
    } else {
        actualEmail = "DEFAULT";
    }

    json data = {
                    "schemas": [],
                    "name": {
                        "givenName": name,
                        "familyName": ""
                    },
                    "userName": "DEFAULT/"+actualEmail,
                    "password": "aBcd!23",
                    "emails": [
                        {
                        "value": email,
                        "primary": true
                        }
                    ],
                    "urn:ietf:params:scim:schemas:extension:enterprise:2.0:User": {
                        "employeeNumber": "1234A",
                        "manager": {
                        "value": "Taylor"
                        },
                        "verifyEmail": true
                    },
                    "urn:scim:wso2:schema": {
                        "askPassword": true
                    }
                };
    return data;
}