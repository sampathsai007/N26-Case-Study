
@isTest
public class ProductInformationControllerTest {

    @isTest
    static void Test1() {

        Product2 product = TestDataFactory.initProduct();
        Contact con = TestDataFactory.initContact();
        con.Product__c =  product.Id;
        con.Home_Country__c = 'DE';
        update con;
        Case c = TestDataFactory.initCase(con);
        
        Test.startTest();
        Product__mdt result = ProductInformationController.getProductInformation(c.Id);
        Test.stopTest();

        System.assertEquals('1.7%',result.ATM_Fee_in_other_currencies__c);
        System.assertEquals('€ 0',result.Cost_per_Calendar_Month__c);
        System.assertEquals('€ 6',result.Card_Replacement_Cost__c);

    }
}