@RestResource(UrlMapping='/customer')
global inherited sharing class CustomerRestResource {
  @HttpPost
  global static void createNewCustomer(CustomerInfo customerInfo) {
    SFTransaction sfTransaction = (SFTransaction) new TransactionFactory()
      .begin();
    sfTransaction.save(new Customer());
    sfTransaction.commitZ();
  }
}
