using { salesdetails.db.master, salesdetails.db.transaction  } from '../db/data-model';
using { salesdetails.cdsviews } from '../db/CDSViews';

service CatalogServiceSo @(path: 'CatalogServiceSo', requires: 'authenticated-user'){

entity AddressSet as projection on master.address;
entity BusinessPartnerSet as projection on master.businesspartner;
entity SalesOrderSet @( 
    odata.draft.enabled: true,
    Common.DefaultValuesFunction: 'getOrderDefault' 
) as projection on transaction.salesorder{
    *,
    case OVERALL_STATUS
      when 'O' then 'Approved'
      when 'C' then 'Delivered'
      when 'P' then 'Rejected'
      when 'N' then 'New'
      else 'Pending'
      end as OverallStatusText: String(10),
       case OVERALL_STATUS
      when 'O' then 3
      when 'C' then 3
      when 'P' then 1
      when 'N' then 2
      else  2
      end as IconColor: Integer
}

 actions{
        action boost() returns SalesOrderSet;
        action setDelivered() returns SalesOrderSet;
    };

entity SalesItemsSet as projection on transaction.salesitems;

entity ProductSet as projection on cdsviews.CDSViews.ProductView;

function getOrderDefault() returns SalesOrderSet;

}