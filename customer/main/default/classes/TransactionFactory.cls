public inherited sharing class TransactionFactory implements ITransactionFactory {

    public ITransaction begin() {
        return new SFTransaction(
            new Map<Schema.SObjectType, SObjectDMLSettings>{
                Account.SObjectType => new SObjectDMLSettings(Account.SObjectType),
                Contact.SObjectType => new SObjectDMLSettings(Contact.SObjectType)
            }
        );
    }

}
