public inherited sharing class CustomerServiceImpl implements CustomerService {
    private CustomerRepository customerRepository;

    public CustomerServiceImpl() {
        customerRepository = (CustomerRepository) Injector.getInstance(CustomerRepository.class);
    }

    public void newCustomer(ITransaction sfTransaction, List<CreateNewCustomerCommand> newCustomerCommands) {
        for (CreateNewCustomerCommand newCustomerCommand : newCustomerCommands) {
            Customer customer = CustomerFactory.buildFrom(newCustomerCommand);
            this.customerRepository.save(sfTransaction, customer);
        }
    }

    public void newCustomer(ITransaction sfTransaction, CreateNewCustomerCommand newCustomerCommand) {
        this.newCustomer(sfTransaction, new List<CreateNewCustomerCommand>{
            newCustomerCommand
        });
    }

    public Customer getCustomerById(Id customerId) {
        return (Customer) customerRepository.find()
            .byId(customerId)
            .toList()
            .get(0);
    }

    public void activeCustomer(ITransaction sfTransaction, Id customerId) {
        Customer customer = (Customer) this.customerRepository.find().byId(customerId).toList().get(0);
        customer.activate();
        customerRepository.save(sfTransaction, customer);
    }

    public void deactivateCustomer(ITransaction sfTransaction, String customerId) {
        Customer customer = (Customer) this.customerRepository.find().byId(customerId).toList().get(0);
        customer.deactivate();
        customerRepository.save(sfTransaction, customer);
    }

}
