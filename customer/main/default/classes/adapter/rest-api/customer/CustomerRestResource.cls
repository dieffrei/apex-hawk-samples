@RestResource(UrlMapping='/customer')
global inherited sharing class CustomerRestResource {
  @HttpPost
  global static void createNewCustomer(CustomerInfo customerInfo) {
    SFTransaction sfTransaction = (SFTransaction) new TransactionFactory()
      .begin();

    Customer customer = CustomerFactory.buildFrom(customerInfo);

    new CustomerService().createCustomer(sfTransaction);

    sfTransaction.commitZ();
  }
}
