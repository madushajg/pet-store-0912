import ballerina/http;
import ballerina/log;

# A service representing a network-accessible API
# bound to port `9090`.
@display {
    label: "user-management",
    id: "user-management-6026dc7c-fd75-488c-af41-17735c340f43"
}
service / on new http:Listener(9092) {

    # A resource for generating greetings
    # + name - the input string name
    # + return - string name with hello message or error
    resource function get getUser(string name) returns string|error {
        log:printInfo("Get user called with name: " + name);
        if name is "" {
            return error("name should not be empty!");
        }
        return "Hello, " + name;
    }
}
