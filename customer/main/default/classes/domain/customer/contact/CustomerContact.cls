public inherited sharing class CustomerContact extends Entity {

    public CustomerContact(SObject record) {
        super(record);
    }

    public CustomerContact() {
        super(Contact.SObjectType);
    }

}
