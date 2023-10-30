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
    http:Client inventoryClient;

    function init() returns error? {
        self.salesClient = check new ("https://2f4ebd99-ec9e-4508-96d9-6df9d51db292-dev.e1-us-east-azure.preview-dv.choreoapis.dev/igcs/salesservice/sales-90c/v1.0");
        self.inventoryClient = check new ("https://2f4ebd99-ec9e-4508-96d9-6df9d51db292-dev-internal.e1-us-east-azure.internal.preview-dv.choreoapis.dev/lpar/inventory/inventory-20c/v1.0");

    }


    # A resource for generating greetings
    # + return - string name with hello message or error
    resource function get getCartItem() returns string|error {
        log:printInfo("cart service invoked");
        string sales = check self.salesClient->get("/salesInRegionA");
        string[] items = check self.inventoryClient->/allItems;
        return string `sales: ${sales}, items: ${items.toString()}`;
    }
}
