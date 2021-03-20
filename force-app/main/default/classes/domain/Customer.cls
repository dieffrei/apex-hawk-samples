public inherited sharing class Customer extends Entity {
  public Customer() {
    super(Schema.Account.SObjectType);
  }

  public Customer(Account record) {
    super(record);
  }

  public void generateRandomName() {
    this.put(Account.Name, 'Random name');
  }

  public String getName() {
    return (String) this.get(Account.Name);
  }
}
