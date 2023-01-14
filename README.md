
# N26-Case-Study

The Lwc Component named "productInformation" is created And Placed on the Case Layout .

The Lwc component displays the product information based on the tables given in the case Study .

Apex classes Related to the LWC

ProductInformationController
ProductInformationService
CaseDAO

Requirements for the component to work :
1.The case should be related to a Contact .  
2.The fields "Product__c" And "Home_Country__c"  of the related contact must be filled with the values present in the table .

Salesforce Rest Api is Exposed with the get Method . This method returns the product information based on the UUID passed in the url .   
The input parameter for this api is "UUID"  .

URL : /services/apexrest/ProductInformation?UUID=f8ebf35a-3e48-4af1-adaa-6d5cc2f8ac4e (Example)

Apex Class
MyRestResource

Given Tables in the case study are stored as Custom Metadata "Product__mdt" .

Test Classes
MyRestResourceTest
ProductInformationControllerTest



