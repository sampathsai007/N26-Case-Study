@isTest
public class TestDataFactory {

    public static Case  initCase(Contact con){
        Case c = new Case();
        c.contactId = con.Id ;
        insert c;
        return c;
    }

    public static Contact initContact(){
        Contact c = new Contact();
        c.LastName = 'contact';
        c.Phone = '323232323';
        c.Email = 'test@test.com';
        c.UUID__c = '01de1851-e977-4b10-91b9-06fdf8fffb4c';
        insert c;
        return c;
    }

    public static Product2 initProduct() {
        Product2 product = new Product2(
            Name = 'Standard'
        );
        insert product;
        return product;
    }

    
}