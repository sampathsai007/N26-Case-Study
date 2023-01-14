// In this class we are exposing the salesforce rest get Api to retrieve the product information -- UUID as input and Product information as output
@RestResource(urlMapping='/ProductInformation/*')
global with sharing class MyRestResource {
    @HttpGet
    global static void doGet() {
        RestRequest req = RestContext.request;
        RestResponse res = RestContext.response;
        Contact con = new Contact();
        try{
            //Get UUID Parameter from the URL
            String contactUUID = RestContext.request.params.get('UUID');
            try{
                if(contactUUID != null){
                 con = [SELECT Id, Name,Product__r.Name,Home_Country__c,UUID__c FROM Contact WHERE UUID__c = :contactUUID];
                }
            }
            catch (Exception e) {
                //fail gracefully
            }
            if(con != null && con.Product__r.Name != null && con.Home_Country__c != null){
                String productName = con.Product__r.Name;
                String homeCountry = con.Home_Country__c ;

                Product__mdt product = new Product__mdt();
                try{
                     product = [SELECT Id,ATM_Fee_in_other_currencies__c,Cost_per_Calendar_Month__c,Card_Replacement_Cost__c,Home_Country__c,Product_Name__c FROM Product__mdt WHERE Home_Country__c =:homeCountry AND Product_Name__c =:productName];
                }
                catch (Exception e) {
                    //fail gracefully
                }
                if(product != null){
                    ResponseDTO response = new ResponseDTO();
                    response.ProductName = product.Product_Name__c;
                    response.HomeCountry = product.Home_Country__c;
                    response.ATMFeeinothercurrencies = product.ATM_Fee_in_other_currencies__c;
                    response.CostperCalendarMonth = product.Cost_per_Calendar_Month__c ;
                    response.CardReplacementCost = product.Card_Replacement_Cost__c;
                    res.responseBody = Blob.valueOf(JSON.serialize(response));
                    res.statusCode = 200;
                }
            }else{
                res.statusCode = 400;
                res.responseBody = Blob.valueOf('{ "status":"Wrong UUID " }');
            }
        }
        catch (Exception e) {
            res.responseBody = Blob.valueOf('{"message": "' + e.getMessage() + ' - ' + e.getTypeName() + '"}');
            res.statusCode = 400;
        }
    }

   global class ResponseDTO{
        String ProductName;
        String HomeCountry;
        String ATMFeeinothercurrencies ;
        String CostperCalendarMonth ;
        String CardReplacementCost ;
     }
}