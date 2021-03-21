/**
 * Only factories can
 */
public inherited sharing class CustomerFactory extends Customer {

    public static Customer buildFrom(CreateNewCustomerCommand customerCommand) {
        Customer customer = new Customer();
        customer.put(Account.Name, customerCommand.name);
        return customer;
    }

}
