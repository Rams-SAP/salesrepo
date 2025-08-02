namespace salesdetails.commons;

using { Currency } from '@sap/cds/common';


//Reusable types: which we can refer for all tables
    type Guid : String(32);

    

    type Gender : String(1) enum{
        male = 'M';
        female = 'F';
        undisclosed = 'U';
    };

    type AmountT : Decimal(10,2) @(
     Semantic.amount.currencyCode: 'CURRENCY_code',
     sap.unit: 'CURRENCY_code'
    );

//Aspects - Structure like append structure in ABAP
aspect Amount : {
    CURRENCY : Currency @title : '{i18n>XLBL_CURR}';
    GRASS_AMOUNT:AmountT @title : '{i18n>XLBL_GROSS}';
    NET_AMOUNT:AmountT @title : '{i18n>XLBL_NET}';  
    TAX_AMOUNT:AmountT @title : '{i18n>XLBL_TAX}';

}

    //Adding regular expression we can learn this from W3schools.com regex.javascript
    type PhoneNumber : String(30); // @assert.format : '/^(\+91[\-\s]?|0)?[6-9]\d{9}$/';
    type EmailAddress: String(255); // @assert.format: '/^(\+91[\-\s]?|0)?[6-9]\d{9}$/';
    
    
    
