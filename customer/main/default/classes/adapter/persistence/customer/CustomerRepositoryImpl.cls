public inherited sharing class CustomerRepositoryImpl implements CustomerRepository {
  private QuerySpecification querySpecification;

  @TestVisible
  private class CustomerBuilder implements IEntityBuilder {
    public Entity build(SObject record) {
      return new Customer((Account) record);
    }
  }

  @TestVisible
  private CustomerRepositoryImpl(QuerySpecification querySpecification) {
    this.querySpecification = querySpecification;
  }

  public CustomerRepositoryImpl() {
    //this.querySpecification = new QuerySpecification(new CustomerBuilder());
  }

  public IQueryResult enrich(List<SObject> records) {
    return this.querySpecification.enrich(records);
  }

  public QuerySpecification find() {
    return this.querySpecification;
  }

  public void save(ITransaction sfTransaction, Customer customer) {
    sfTransaction.save(customer);
  }

  public void save(ITransaction sfTransaction, List<Customer> customers) {
    for (Customer customer : customers) {
      sfTransaction.save(customer);
    }
  }

  public void remove(ITransaction sfTransaction, Customer customer) {
    sfTransaction.remove(customer);
  }

  public void remove(ITransaction sfTransaction, List<Customer> customers) {
    for (Customer customer : customers) {
      sfTransaction.remove(customer);
    }
  }
}
