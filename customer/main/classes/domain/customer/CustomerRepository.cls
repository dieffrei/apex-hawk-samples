public interface CustomerRepository {
    CustomerQuerySpecification find();
    void save(ITransaction sfTransaction, Customer customer);
    void save(ITransaction sfTransaction, List<Customer> customer);
    void remove(ITransaction sfTransaction, Customer customer);
    void remove(ITransaction sfTransaction, List<Customer> customer);
}
