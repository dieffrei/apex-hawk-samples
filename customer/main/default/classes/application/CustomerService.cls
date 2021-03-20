public inherited sharing class CustomerService {
  private CustomerRepository customerRepository;

  @TestVisible
  private CustomerService(CustomerRepository customerRepository) {
    customerRepository = customerRepository;
  }

  public CustomerService() {
    customerRepository = new CustomerRepositoryImpl();
  }

  public void createCustomer(SFTransaction sfTransaction) {
    Customer customer = new Customer();
    new CustomerRepositoryImpl().save(sfTransaction, customer);
  }
}
