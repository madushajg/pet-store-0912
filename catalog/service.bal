import ballerina/http;
import ballerina/log;

# A service representing a network-accessible API
# bound to port `9090`.
@display {
	label: "catalog",
	id: "catalog-a8e5007c-7100-4f85-ac09-7bb8ad797e6e"
}
service / on new http:Listener(9090) {

    # A resource for generating greetings
    # + name - the input string name
    # + return - string name with hello message or error
    resource function get getCatalog(string name) returns string|error {
        log:printInfo("Catalog service invoked for name: " + name);
        // Send a response back to the caller.
        if name is "" {
            return error("name should not be empty!");
        }
        return "Hello, " + name;
    }
}
