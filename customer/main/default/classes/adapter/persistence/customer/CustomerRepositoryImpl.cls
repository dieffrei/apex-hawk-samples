public inherited sharing class CustomerRepositoryImpl implements CustomerRepository {
  private CustomerQuerySpecification querySpecification;

  @TestVisible
  private class CustomerBuilder implements IEntityBuilder {
    public Entity build(SObject record) {
      return new Customer((Account) record);
    }
  }

  @TestVisible
  private CustomerRepositoryImpl(
    CustomerQuerySpecification querySpecification
  ) {
    this.querySpecification = querySpecification;
  }

  public CustomerRepositoryImpl() {
    this.querySpecification = new CustomerQuerySpecification(
      new CustomerBuilder()
    );
  }

  public IQueryResult enrich(List<SObject> records) {
    return this.querySpecification.enrich(records);
  }

  public CustomerQuerySpecification find() {
    return this.querySpecification;
  }

  public void save(ITransaction sfTransaction, Customer customer) {
    sfTransaction.save(customer);
    for (CustomerContact contact : customer.contacts) {
      sfTransaction.save(contact);
    }
  }

  public void save(ITransaction sfTransaction, List<Customer> customers) {
    for (Customer customer : customers) {
      save(sfTransaction, customer);
    }
  }

  public void remove(ITransaction sfTransaction, Customer customer) {
    sfTransaction.remove(customer);
  }

  public void remove(ITransaction sfTransaction, List<Customer> customers) {
    for (Customer customer : customers) {
      remove(sfTransaction, customer);
    }
  }
}
