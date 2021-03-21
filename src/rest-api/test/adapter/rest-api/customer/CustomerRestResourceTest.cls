@IsTest
private class CustomerRestResourceTest {

    @IsTest
    static void createNewCustomer_InvalidCustomerName_ThrowException() {
        //given
        String customerName = null;
        //when
        CustomerRestResource.createNewCustomer(new CustomerInfo(customerName));
    }

    @IsTest
    static void createNewCustomer_ValidName_Success() {
        //given
        String customerName = 'Dieffrei Quadros';
        //when
        CustomerRestResource.createNewCustomer(new CustomerInfo(customerName));
        //assert
        System.assertEquals(1, [SELECT COUNT() FROM Account]);
    }

}
