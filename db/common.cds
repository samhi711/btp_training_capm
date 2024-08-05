namespace samhitha.common;

using { sap, Currency, temporal, managed } from '@sap/cds/common';


type Gender : String(1) enum{
male = 'M';
female = 'F';
 noBinary = 'N';
noDisclosure = 'D';
 selfDescribe = 'S';

};

type AmountT : Decimal(15,2)@(
Semantics.amount.CurrencyCode: 'CURRENCY_CODE',
 sap.unit: 'CURRENCY_CODE'
);

abstract entity  Amount {
   CURRENCY_CODE: String(4);
    GROSS_AMOUNT: AmountT;
       NET_AMOUNT: AmountT;
        TAX_AMOUNT: AmountT;
    

}
type phoneNumber : String(30)@assert.format : '(\+\d{1,3}\s?)?((\(\d{3}\)\s?)|(\d{3})(\s|-?))(\d{3}(\s|-?))(\d{4})(\s?(([E|e]xt[:|.|]?)|x|X)(\s?\d+))?';
type email : String(255)@assert.format : '^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$';

