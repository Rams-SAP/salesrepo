namespace salesdetails.cdsviews;

using { salesdetails.db.master, salesdetails.db.transaction  } from './data-model';

context CDSViews {

define view ![SOWorklist] as select 
from transaction.salesorder{
    key SO_ID AS ![SalesOrderID],
    key Items.SO_ITEM as ![ItemPosition],
    CUST_ID.BP_ID as ![PartnerId],
    CUST_ID.COMPANY_NAME as ![CompanyName],
    Items.MATERIAL as ![Material],
    Items.QUANTITY as ![Quantity],
    Items.NETPRICE as ![NetPrice],
    Items.UOM as ![UnitOfMeasure],
    OVERALL_STATUS as ![Status],
    Items.PRODUCT_ID.CATEGORY as ![Category],
    Items.PRODUCT_ID.DESCRIPTION as ![Description],
    CUST_ID.ADDRESS_GUID.COUNTRY as ![Country],
    CUST_ID.ADDRESS_GUID.STREET as ![Street]

}

define view ![ItemView] as select from transaction.salesitems{
    key SO_ID as ![SalesOrderID],
    key SO_ITEM as ![ItemPosition],
        PRODUCT_ID.PRODUCT_ID as ![productId],
        MATERIAL as ![Material],
        QUANTITY as ![Quantity],
        UOM as ![UnitOfMeasure],
        NETPRICE as ![NetPrice]        
}


define view ![ProductView] as select from master.product

mixin{
SO_ITEM: Association to  many ItemView on SO_ITEM.productId = $projection.ProductId
} into {
    PRODUCT_ID as ![ProductId],
    DESCRIPTION as ![ProductName],
    CATEGORY as ![Category],
    SUPPLIER_ID.CUST_ID as ![SupplierId],
    SUPPLIER_ID.COMPANY_NAME as ![CompanyName],
    SUPPLIER_ID.ADDRESS_GUID.COUNTRY as ![Country],
    SO_ITEM as ![To_Items]
}



}