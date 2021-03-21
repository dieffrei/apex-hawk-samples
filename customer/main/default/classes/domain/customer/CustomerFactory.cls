public inherited sharing class CustomerFactory {

  public static Customer buildFrom(CreateNewCustomerCommand customerCommand) {
        return new Customer();
    }
}
