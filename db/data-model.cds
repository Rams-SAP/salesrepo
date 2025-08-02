//refreing our custom aspect
using {salesdetails.commons as commons} from './commons';

using {managed} from '@sap/cds/common';


namespace salesdetails.db;

context master {

    entity businesspartner {
        key CUST_ID       : String(10) @title : '{i18n>XLBL_CUSTID}';
            BP_ROLE       : String(2);
            EMAIL_ADDRESS : String(105);
            PHONE_NUMBER  : String(32);
            FAX_NUMBER    : String(32);
            WEB_ADDRESS   : String(44);
            BP_ID         : String(255);    
            COMPANY_NAME  : String(250) @title : '{i18n>XLBL_COMPNAME}';
            ADDRESS_GUID  : Association to one address
    }

    entity address {
        key ADDRESS_ID      : String(10);
            NAME1           : String(50) @title : '{i18n>XLBL_CNAME}';
            POSTAL_CODE     : String(8) @title : '{i18n>XLBL_POST}';
            STREET          : String(44) @title : '{i18n>XLBL_STREET}';
            BUILDING        : String(128);
            COUNTRY         : String(44) @title : '{i18n>XLBL_CNTRY}';
            ADDRESS_TYPE    : String(44);
            VAL_START_DATE  : Date;
            VAL_END_DATE    : Date;
            LATITUDE        : Decimal;
            LONGITUDE        : Decimal;
            //backward relation - help us to read teh data of BP from address
            businesspartner : Association to one businesspartner
                                  on businesspartner.ADDRESS_GUID = $self;
    }

    entity product {
        key PRODUCT_ID      : String(10);
            TYPE_CODE       : String(2);
            CATEGORY        : String(32);
            //The moment we add localized then system will automatically
            //will add another table with product_texts
            DESCRIPTION     : localized String(255);
            SUPPLIER_ID     : Association to businesspartner;
            TAX_TARRIF_CODE : Integer;
            MEASURE_UNIT    : String(2);
            WEIGHT_MEASURE  : Decimal(5, 2);
            WEIGHT_UNIT     : String(2);
            CURRENCY_CODE   : String(4);
            PRICE           : Decimal(15, 2);
            WIDTH           : Decimal(15, 2);
            DEPTH           : Decimal(15, 2);
            HEIGHT          : Decimal(15, 2);
            DIM_UNIT        : String(2);

    }

    entity material {
        key MATERIAL    : String(18) @title : '{i18n>XLBL_MAT}';
            MATTYPE     : String(55) @title : '{i18n>XLBL_MATTYPE}'; 
            MATGROUP    : String(33) @title : '{i18n>XLBL_MATGRP}';
    }

}

context transaction {
    entity salesorder : managed {
        key SO_ID            : String(10) @title : '{i18n>XLBL_SOID}';
            CUST_ID          : Association to one master.businesspartner @title : '{i18n>XLBL_CUST_ID}';
            LIFECYCLE_STATUS : String(1) @title : '{i18n>XLBL_LSTAT}';
            OVERALL_STATUS   : String(1) @title : '{i18n>XLBL_OSTAT}';
            Items            : Composition of many salesitems
                                   on Items.SO_ID = $self;
    }

    entity salesitems {
        key SO_ID      : Association to one salesorder @title : '{i18n>XLBL_SOID}';
        key SO_ITEM    : String(5) @title : '{i18n>XLBL_SOITEM}';
            MATERIAL   : Association to one master.material;
            QUANTITY   : String(10) @title : '{i18n>XLBL_QUAN}';
            UOM        : String(3) @title : '{i18n>XLBL_UOM}';
            NETPRICE   : commons.AmountT @title : '{i18n>XLBL_NETPR}';
            PRODUCT_ID : Association to one master.product;
    }


    entity delorder : managed {
        key DEL_ID   : String(10);
            REF_DOC  : Association to salesorder;
            DEL_TYPE : String(4);
            DEL_DATE : Date;
    }

    entity delitem {
        key DEL_ID     : Association to one delorder;
        key DEL_ITEM   : String(5);
            PLANT      : String(4);
            STORAGELOC : String(4);
    }

}
