@RestResource(UrlMapping='/customer')
global inherited sharing class CustomerRestResource {

    @HttpPost
    global static void createNewCustomer(CustomerInfo customerInfo) {
        CustomerService customerService = (CustomerService) Injector.getInstance(
            CustomerService.class
        );
        SFTransaction sfTransaction = (SFTransaction) new TransactionFactory()
            .begin();

        CreateNewCustomerCommand newCustomerCommand = new CreateNewCustomerCommand();
        newCustomerCommand.name = customerInfo.name;
        customerService.newCustomer(newCustomerCommand, sfTransaction);

        sfTransaction.commitZ();
    }

    @HttpGet
    global static String getCustomer() {
        CustomerService customerService = (CustomerService) Injector.getInstance(
            CustomerService.class
        );
        return JSON.serialize(customerService.getCustomerById(null));
    }

}
