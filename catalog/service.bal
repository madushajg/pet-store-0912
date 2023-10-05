import ballerina/http;
import ballerina/log;

# A service representing a network-accessible API
# bound to port `9090`.
@display {
    label: "catalog",
    id: "catalog-a8e5007c-7100-4f85-ac09-7bb8ad797e6e"
}
service / on new http:Listener(9090) {

    @display {
        label: "order-management",
        id: "order-management-02b994ea-cf8a-4959-86ba-200f913e3e19"
    }
    http:Client orderManagementClient;

    function init() returns error? {
        self.orderManagementClient = check new ("https://2f4ebd99-ec9e-4508-96d9-6df9d51db292-dev-internal.e1-us-east-azure.internal.preview-dv.choreoapis.dev/caex/order-management/orders-1fd/v1.0");
        // self.orderManagementClient = check new ("http://localhost:9093");
    }

    # A resource for generating greetings
    # + name - the input string name
    # + return - string name with hello message or error
    resource function get getCatalog(string name) returns string|error {
        log:printInfo("Catalog service invoked for name: " + name);
        string orderId = check self.orderManagementClient->get("/orders");
        log:printInfo("Order ID: " + orderId);
        // Send a response back to the caller.
        if name is "" {
            return error("name should not be empty!");
        }
        return "Hello, " + name;
    }
}
