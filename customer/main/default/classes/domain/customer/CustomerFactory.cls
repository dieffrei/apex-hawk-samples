public inherited sharing class CustomerFactory {

  public static Customer buildFrom(CustomerInfo customerInfo) {
        return new Customer();
    }

  public static Customer buildFrom(CreateNewCustomerCommand customerCommand) {
        return new Customer();
    }
}
