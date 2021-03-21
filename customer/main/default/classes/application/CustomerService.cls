public interface CustomerService {
    void newCustomer(ITransaction sfTransaction, List<CreateNewCustomerCommand> newCustomerCommands);
    void newCustomer(ITransaction sfTransaction, CreateNewCustomerCommand newCustomerCommands);
    Customer getCustomerById(String Id);
    void activeCustomer(ITransaction sfTransaction, String customerId);
    void deactivateCustomer(ITransaction sfTransaction, String customerId);
}
