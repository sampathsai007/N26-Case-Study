@isTest
public  class MyRestResourceTest {
    @isTest
    static void testGetMethod() {

        Product2 product = TestDataFactory.initProduct();
        Contact con = TestDataFactory.initContact();
        con.Product__c =  product.Id;
        con.Home_Country__c = 'DE';
        update con;

        RestRequest req = new RestRequest(); 
        RestResponse res = new RestResponse();

        req.requestURI = '/services/apexrest/ProductInformation'; 
        req.addParameter('UUID', '01de1851-e977-4b10-91b9-06fdf8fffb4c');
        req.httpMethod = 'GET';
        RestContext.request = req;
        RestContext.response = res;

        MyRestResource.doGet();
        System.assertEquals(200,res.statusCode);

    }
}