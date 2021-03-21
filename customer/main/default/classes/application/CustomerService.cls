public interface CustomerService {
    void newCustomer(List<CreateNewCustomerCommand> newCustomerCommands, ITransaction sfTransaction);
    void newCustomer(CreateNewCustomerCommand newCustomerCommands, ITransaction sfTransaction);
    Customer getCustomerById(String Id);
}
