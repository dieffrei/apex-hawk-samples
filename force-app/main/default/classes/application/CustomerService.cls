public inherited sharing class CustomerService {
  public void createCustomer(SFTransaction sfTransaction) {
    Customer customer = new Customer();
    new CustomerRepositoryImpl().save(sfTransaction, customer);
  }
}
