/**
 * <h1>Customer Entity</h1>
 * An Aggregation representing Customer and theirs contacts.
 * Constructors are protected to ensure only Builders and Factories can build new instances of this entity.
 * Only Exposes some attributes as protected visibility that way we prevent side effects
 * and an <i><a href="https://martinfowler.com/bliki/AnemicDomainModel.html">Anemic Domain Mode</a></i>.
 */
public virtual inherited sharing class Customer extends Entity {

    public String name {
        get {
            return (String) get(Account.Name);
        }
    }

    public Boolean isActive {
        get {
            return (Boolean) get(Account.IsActive__c);
        }
    }

    public List<CustomerContact> contacts;

    public Customer() {
        super(Schema.Account.SObjectType);
    }

    public Customer(Account record) {
        super(record);
    }

    public void activate(){
        put(Account.IsActive__c, true);
    }

    public void deactivate(){
        put(Account.IsActive__c, false);
    }

    public Customer addContact(CustomerContact contact) {
        this.contacts.add(contact);
        return this;
    }
}
