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

    public void activate(){
        this.put(Account.IsActive__c, true);
    }

    public void deactivate(){
        this.put(Account.IsActive__c, false);
    }

    public Customer addContact(CustomerContact contact) {
        this.contacts.add(contact);
        return this;
    }
}
