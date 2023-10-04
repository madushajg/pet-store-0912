import ballerina/http;

# A service representing a network-accessible API
# bound to port `9093`.
@display {
	label: "order-management",
	id: "order-management-02b994ea-cf8a-4959-86ba-200f913e3e19"
}
service / on new http:Listener(9093) {

    # A resource for generating greetings
    # + name - the input string name
    # + return - string name with hello message or error
    resource function get greeting(string name) returns string|error {
        // Send a response back to the caller.
        if name is "" {
            return error("name should not be empty!");
        }
        return "Hello, " + name;
    }
}
