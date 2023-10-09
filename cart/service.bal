import ballerina/http;
import ballerina/log;

# A service representing a network-accessible API
# bound to port `9090`.
@display {
	label: "cart",
	id: "cart-5838250d-9d75-496c-8427-adf0e757f640"
}
service / on new http:Listener(9091) {

    http:Client salesClient;

    function init() returns error? {
        self.salesClient = check new ("http://salesservice-3984432628:9081");
    }


    # A resource for generating greetings
    # + return - string name with hello message or error
    resource function get getCartItem() returns string|error {
        log:printInfo("cart service invoked");
        string sales = check self.salesClient->get("/salesInRegionA");
        return string `sales: ${sales}`;
    }
}
