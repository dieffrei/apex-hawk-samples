public inherited sharing class CustomerServiceImpl implements CustomerService {
    private CustomerRepository customerRepository;

    public CustomerServiceImpl() {
        customerRepository = (CustomerRepository) Injector.getInstance(CustomerRepository.class);
    }

    public void newCustomer(List<CreateNewCustomerCommand> newCustomerCommands, ITransaction sfTransaction) {
        for (CreateNewCustomerCommand newCustomerCommand : newCustomerCommands) {
            Customer customer = CustomerFactory.buildFrom(newCustomerCommand);
            this.customerRepository.save(sfTransaction, customer);
        }
    }

    public void newCustomer(CreateNewCustomerCommand newCustomerCommand, ITransaction sfTransaction) {
        this.newCustomer(newCustomerCommand, sfTransaction);
    }

    public Customer getCustomerById(String customerId) {
        return (Customer)customerRepository.find()
            .byId(customerId)
            .toList()
            .get(0);
    }
}
