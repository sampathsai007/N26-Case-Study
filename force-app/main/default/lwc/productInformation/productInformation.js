import { LightningElement,api,wire } from 'lwc';
import getProductInformation from '@salesforce/apex/ProductInformationController.getProductInformation';


export default class ProductInformation extends LightningElement {

    @api recordId;

    //Variables

    valueOfCostPerMonth = '';
    valueOfAtmFee = '';
    valueOfReplacementCost = '';
    productName = '';
    homeCountry = '';
    informationAvailable = false;

    //wire callout to get the product information based on the case Id

    @wire(getProductInformation,{ caseId: '$recordId'})
    wiredinformation({ error, data }) {

        if (data) {
            this.valueOfCostPerMonth = data.Cost_per_Calendar_Month__c;
            this.valueOfAtmFee = data.ATM_Fee_in_other_currencies__c;
            this.valueOfReplacementCost = data.Card_Replacement_Cost__c;
            this.productName = data.Product_Name__c;
            this.homeCountry = data.Home_Country__c;
            this.informationAvailable = true;
            this.error = undefined;
        } else if (error) {
            this.error = error;
        }
    }

}