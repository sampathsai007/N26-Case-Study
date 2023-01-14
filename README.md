
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

Given Tables in the case study are stored as Custom Metadata "Product__mdt" . The reason for the customMetdata approach is these are customizable, deployable easily . Compared to the custom objects and custom settings these are robust and Faster.

Test Classes
MyRestResourceTest
ProductInformationControllerTest

GitHub Link : https://github.com/sampathsai007/N26-Case-Study

![Screenshot 2023-01-14 at 11 12 21 PM](https://user-images.githubusercontent.com/48951014/212499552-15c7d283-0ae7-425b-ad66-82bb282ff570.png)
![Screenshot 2023-01-14 at 11 11 48 PM](https://user-images.githubusercontent.com/48951014/212499575-1da45a2c-6aff-420e-8f28-9f3143ef4eaf.png)
![Screenshot 2023-01-14 at 11 10 17 PM](https://user-images.githubusercontent.com/48951014/212499609-bfb4c45e-df87-481e-9587-89e4baa749f0.png)



