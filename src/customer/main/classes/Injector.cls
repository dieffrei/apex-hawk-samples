/**
 * Just simple implementation of a DI.
 * Use force-di or another Di library as you want
 */
@NamespaceAccessible
public virtual inherited sharing class Injector {

    private static Map<Type, Type> mapping = new Map<Type, Type>{
        CustomerService.class => CustomerServiceImpl.class,
        CustomerRepository.class => CustomerRepositoryImpl.class
    };

    public static Object getInstance(Type interfaceType) {
        return mapping.get(interfaceType).newInstance();
    }
}
