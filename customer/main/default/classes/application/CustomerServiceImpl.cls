public inherited sharing class CustomerServiceImpl implements CustomerService {
  private CustomerRepository customerRepository;

  @TestVisible
  private CustomerServiceImpl(CustomerRepository customerRepository) {
    customerRepository = customerRepository;
  }

  public CustomerServiceImpl() {
    customerRepository = new CustomerRepositoryImpl();
  }

  public void newCustomer(
    List<CreateNewCustomerCommand> newCustomerCommands,
    ITransaction sfTransaction
  ) {
    for (CreateNewCustomerCommand newCustomerCommand : newCustomerCommands) {
      Customer customer = CustomerFactory.buildFrom(newCustomerCommand);
      this.customerRepository.save(sfTransaction, customer);
    }
  }

  public void newCustomer(
    CreateNewCustomerCommand newCustomerCommand,
    ITransaction sfTransaction
  ) {
    this.newCustomer(newCustomerCommand, sfTransaction);
  }

  public Customer getCustomerById(String Id) {
    return null;
  }
}
