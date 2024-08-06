namespace samhitha.db;

using { cuid , temporal, Currency } from '@sap/cds/common';
using { samhitha.common } from './common';




type Guid : String(32);

context master {

    entity businesspartner {
        Key NODE_KEY: Guid;
        BP_ROLE: String(2);
        EMAIL_ADDRESS: String(64);
        PHONE_NUMBER: String(14);
        FAX_NUMBER: String(14);
        WEB_ADDRESS: String(64);
       // ADDRESS_GUID: String(32);
       ADDRESS_GUID : Association to address;
        BP_ID: String(16);
        COMPANY_NAME: String(84);  
        
    }

  annotate  businesspartner with{
    NODE_KEY @title : '{i18n>bp key}' ;
    BP_ROLE @title : '{i18n>bp_role}' ;
    COMPANY_NAME @title : '{i18n>company_name}';
    BP_ID @title : '{i18n>bp_id}';
    EMAIL_ADDRESS @title : '{i18n>email_addr}' ; 

};
    entity address {
       Key NODE_KEY: Guid;
           CITY: String(64);
           POSTAL_CODE: String(14);
           STREET: String(64);
           BUILDING: String(64);
           COUNTRY: String(2);
           VAL_START_DATE: DateTime;
           VAL_END_DATE: DateTime;
           LATITUDE: Decimal;
           LONGITUDE: Decimal;
           businesspartner: Association to one businesspartner on 
        businesspartner.ADDRESS_GUID = $self;
        
    };

/* entity prodtext {
    key NODE_KEY: Guid;
    PARENT_KEY: Guid;
    LANGUAGE: String(2);
    TEXT: String(256);
} */

entity product {

    key NODE_KEY: Guid;
    PRODCUT_ID: String(28);
    TYPE_CODE: String(2);
    CATEGORY: String(32);
    //DESC_GUID: Association to master.prodtext;
    DESCRIPTION: localized String(255);
   // NAME: localized String(65);
    SUPPLIER_GUID: Association to master.businesspartner;
    TAX_TARIF_CODE: String(12);
    MEASURE_UNIT: String(2);
    WEIGHT_MEASURE: Decimal;
    WEIGHT_UNIT: String(2);
    CURRENCY_CODE: String(4);
    PRICE: Decimal;
    WIDTH: Decimal;
    DEPTH: Decimal;
    HEIGHT: Decimal;
    DIM_UNIT: String(2);
}

entity employee: cuid {
    nameFirst: String(40);
    nameMiddle: String(40);
    nameLast: String(40);
    nameInitials: String(40);
    sex: common.Gender;
    language: String(1);
    phoneNumber: common.phoneNumber;
    email: String(32);
    loginName: String(12);
    Currency: Currency;
    salaryAmount: common.AmountT;
    accountNumber: String(16);
    banId: String(20);
    bankName: String(64);
}

    
}






context transaction {

    entity purchaseorder  : common.Amount {  //
        key NODE_KEY: Guid;
        PO_ID: String(24);
        PARTNER_GUID: Association to master.businesspartner;
        LIFESTYLE_STATUS: String(1);
        OVERALL_STATUS: String(1);
        Items: Association to many poitems on Items.PARENT_KEY = $self;

    }

    entity  poitems : common.Amount  {  //
        key NODE_KEY: Guid;
        PARENT_KEY: Association to transaction.purchaseorder;
        PO_ITEM_POS: Integer;
        PRODUCT_GUID: Association to master.product;
        
        
        
        
    }
    
}
 