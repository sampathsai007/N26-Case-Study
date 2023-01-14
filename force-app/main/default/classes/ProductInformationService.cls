
public class ProductInformationService {
    //In This method  Input is  case id as input and fetching the product information from the metadata Product_mdt 
    public static Product__mdt getProductionInformationFromCaseId(Id caseId) {
        List<String> queryFields = new List<String>{'Id','Contact.Product__r.Name','Contact.Home_Country__c'};
        Case c = CaseDAO.getRecordbyId(queryFields,caseId);
        if(c != null){
            String productName = c.Contact.Product__r.Name;
            String homeCountry = c.Contact.Home_Country__c ;
            return [SELECT Id,ATM_Fee_in_other_currencies__c,Cost_per_Calendar_Month__c,Card_Replacement_Cost__c,Home_Country__c,Product_Name__c FROM Product__mdt WHERE Home_Country__c =:homeCountry AND Product_Name__c =:productName];
        }
        else {
            return null;
        }
    }
}