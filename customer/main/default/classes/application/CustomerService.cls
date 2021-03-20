public inherited sharing class CustomerService {
  private CustomerRepository customerRepository;

  @TestVisible
  private CustomerService(CustomerRepository customerRepository) {
    customerRepository = customerRepository;
  }

  public CustomerService() {
    customerRepository = new CustomerRepositoryImpl();
  }

  public void newCustomer(
    List<CreateNewCustomerCommand> newCustomerCommands,
    SFTransaction sfTransaction
  ) {
    for (CreateNewCustomerCommand newCustomerCommand : newCustomerCommands) {
      Customer customer = CustomerFactory.buildFrom(newCustomerCommand);
      this.customerRepository.save(sfTransaction, customer);
    }
  }

  public void newCustomer(
    CreateNewCustomerCommand newCustomerCommand,
    SFTransaction sfTransaction
  ) {
    this.newCustomer(newCustomerCommand, sfTransaction);
  }
}
