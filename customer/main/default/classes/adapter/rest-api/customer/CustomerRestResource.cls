@RestResource(UrlMapping='/customer')
global inherited sharing class CustomerRestResource {
  @HttpPost
  global static void createNewCustomer(CustomerInfo customerInfo) {
    SFTransaction sfTransaction = (SFTransaction) new TransactionFactory()
      .begin();

    CreateNewCustomerCommand newCustomerCommand = new CreateNewCustomerCommand();

    new CustomerService().newCustomer(newCustomerCommand, sfTransaction);

    sfTransaction.commitZ();
  }
}
