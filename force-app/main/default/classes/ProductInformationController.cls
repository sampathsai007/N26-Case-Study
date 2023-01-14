public class ProductInformationController {
    @AuraEnabled(Cacheable = true)
    public static Product__mdt getProductInformation(Id caseId){
        try {
           return ProductInformationService.getProductionInformationFromCaseId(caseId);
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }

}