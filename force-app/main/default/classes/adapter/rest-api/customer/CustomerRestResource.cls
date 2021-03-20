@RestResource(UrlMapping='/customer')
global inherited sharing class CustomerRestResource {
  @HttpPost
  global static void createNewCustomer(CustomerInfo customerInfo) {
  }
}
