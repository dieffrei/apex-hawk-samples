/**
 *
 */
public inherited sharing class Customer extends Entity {
    public List<CustomerContact> contacts;

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

    public Customer addContact(CustomerContact contact) {
        this.contacts.add(contact);
        return this;
    }
}
