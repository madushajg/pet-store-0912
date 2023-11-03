import ballerina/http;
import ballerina/log;

configurable string tokenUrl = ?;
configurable string clientId = ?;
configurable string clientSecret = ?;
configurable string endpoint = ?;

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
    http:Client reviewClient;

    function init() returns error? {
        self.orderManagementClient = check new ("http://order-management-2330531075:9093");
        self.reviewClient = check new (endpoint,
            auth = {
                tokenUrl: tokenUrl,
                clientId: clientId,
                clientSecret: clientSecret
            }
        );
    }
    resource function get getCatalog(string name) returns string|error {
        log:printInfo("Catalog service invoked for name: " + name);
        string orderId = check self.orderManagementClient->get("/orders");
        log:printInfo("Order ID: " + orderId);

        log:printInfo("Fetching reviews...");

        string[] reviews = check self.reviewClient->/allReviews;
        // Send a response back to the caller.
        if name is "" {
            return error("name should not be empty!");
        }
        return string `Reviews: ${reviews.toString()} `;
    }
}
