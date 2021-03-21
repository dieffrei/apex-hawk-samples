@RestResource(UrlMapping='/customer')
global inherited sharing class CustomerRestResource {

    public static final String ID_PARAM = 'Id';

    @HttpPost
    global static void createNewCustomer(CustomerInfo customerInfo) {
        CustomerService customerService = (CustomerService) Injector.getInstance(CustomerService.class);
        SFTransaction sfTransaction = (SFTransaction) new TransactionFactory()
            .begin();

        CreateNewCustomerCommand newCustomerCommand = new CreateNewCustomerCommand();
        newCustomerCommand.name = customerInfo.name;
        customerService.newCustomer(newCustomerCommand, sfTransaction);

        sfTransaction.commitZ();
    }

    @HttpGet
    global static String getCustomer() {
        Id customerId = RestContext.request.params.get(ID_PARAM);
        if (customerId == null) {
            throw new InvalidArgumentException(ID_PARAM, null);
        }
        CustomerService customerService = (CustomerService) Injector.getInstance(CustomerService.class);
        RestRequest request = RestContext.request;
        Customer customer = customerService.getCustomerById(request.params.get(ID_PARAM));
        return JSON.serialize(customer);
    }

}
