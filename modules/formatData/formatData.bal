public function formatdata (int|string|decimal name, int|string|decimal email) returns json{
    json data = {
                    "schemas": [],
                    "name": {
                        "givenName": name,
                        "familyName": "Berry"
                    },
                    "userName": "DEFAULT/kim@gmail.com",
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