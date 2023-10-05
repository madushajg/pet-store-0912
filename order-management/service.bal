import ballerina/http;

# A service representing a network-accessible API
# bound to port `9093`.
@display {
	label: "order-management",
	id: "order-management-02b994ea-cf8a-4959-86ba-200f913e3e19"
}
service / on new http:Listener(9093) {

    # A resource for generating greetings
    # + return - string name with hello message or error
    resource function get orders() returns string {
        return "order 1";
    }
}
