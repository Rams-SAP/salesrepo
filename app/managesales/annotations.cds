using CatalogServiceSo as service from '../../srv/CatalogService';

annotate service.SalesOrderSet with @(
    UI.SelectionFields        : [
        SO_ID,
        CUST_ID.CUST_ID,
        CUST_ID.COMPANY_NAME,
        CUST_ID.ADDRESS_GUID.COUNTRY,
        OVERALL_STATUS
    ],

    UI.LineItem               : [
        {
            $Type: 'UI.DataField',
            Value: SO_ID,
        },
        {
            $Type: 'UI.DataField',
            Value: CUST_ID.CUST_ID,
        },
        {
            $Type: 'UI.DataField',
            Value: CUST_ID.COMPANY_NAME,
        },
        {
            $Type: 'UI.DataField',
            Value: CUST_ID.ADDRESS_GUID.NAME1,
        },
        {
            $Type: 'UI.DataField',
            Value: CUST_ID.ADDRESS_GUID.COUNTRY,
        },
        {
            $Type: 'UI.DataField',
            Criticality: IconColor,
            Value: OverallStatusText,
        },
        
        {
            $Type : 'UI.DataFieldForAction',
            Label : 'boost',
            Inline: true,
            Action: '',
        },
    ],

    UI.HeaderInfo             : {
        TypeName      : 'Sales Order',
        TypeNamePlural: 'Sales Orders',
        Title         : {Value: SO_ID},
        Description   : {Value: CUST_ID.COMPANY_NAME},
        ImageUrl      : 'data:image/jpeg;base64,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'
    },

    UI.Facets                 : [
        {
            $Type : 'UI.CollectionFacet',
            Label : 'Genral Information',
            Facets: [
                {
                    $Type : 'UI.ReferenceFacet',
                    Label : 'Order Details',
                    Target: '@UI.Identification',
                },
                {
                    $Type : 'UI.ReferenceFacet',
                    Label : 'Partner Data',
                    Target: '@UI.FieldGroup#PartnerData',
                },
                {
                    $Type : 'UI.ReferenceFacet',
                    Label : 'Status Info',
                    Target: '@UI.FieldGroup#Status',
                },
            ]
        },
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Order Items',
            Target: 'Items/@UI.LineItem'
        },
    ],

    UI.Identification         : [
        {
            $Type: 'UI.DataField',
            Value: SO_ID,
        },
        {
            $Type: 'UI.DataField',
            Value: CUST_ID_CUST_ID,
        },
        {
            $Type: 'UI.DataField',
            Value: LIFECYCLE_STATUS,
        },
        {
            $Type : 'UI.DataFieldForAction',
            Label : 'Submit',
            Action: 'CatalogServiceSo.setDelivered'
        },
    ],

    UI.FieldGroup #PartnerData: {
        Label: 'Partner Data',
        Data : [
            {
                $Type: 'UI.DataField',
                Value: CUST_ID_CUST_ID,
            },
            {
                $Type: 'UI.DataField',
                Value: CUST_ID.COMPANY_NAME,
            },
            {
                $Type: 'UI.DataField',
                Value: CUST_ID.ADDRESS_GUID.NAME1,
            },
            {
                $Type: 'UI.DataField',
                Value: CUST_ID.ADDRESS_GUID.STREET,
            },
            {
                $Type: 'UI.DataField',
                Value: CUST_ID.ADDRESS_GUID.COUNTRY,
            },
            {
                $Type: 'UI.DataField',
                Value: CUST_ID.ADDRESS_GUID.POSTAL_CODE,
            },
        ]

    },


    UI.FieldGroup #Status     : {
        Label: 'Status Info',
        Data : [
            {
                $Type: 'UI.DataField',
                Value: LIFECYCLE_STATUS,
            },
            {
                $Type: 'UI.DataField',
                Criticality: IconColor,
                Value: OVERALL_STATUS,
            },
        ]
    }
);

annotate service.SalesItemsSet with @(
UI.LineItem :[
    {
        $Type : 'UI.DataField',
        Value : SO_ITEM,
    },
    {
        $Type : 'UI.DataField',
        Value : MATERIAL_MATERIAL,
    },
    {
        $Type : 'UI.DataField',
        Value : QUANTITY,
    },
    {
        $Type : 'UI.DataField',
        Value : UOM,
    },
    {
        $Type : 'UI.DataField',
        Value : NETPRICE,
    },
    {
        $Type : 'UI.DataField',
        Value : PRODUCT_ID_PRODUCT_ID,
    },
    {
        $Type : 'UI.DataField',
        Value : PRODUCT_ID.Category,
    },
]

) ;

//F4 help for Selection Field
annotate service.BusinessPartnerSet with {
    CUST_ID @Common.ValueList: {
        CollectionPath: 'BusinessPartnerSet',
        Parameters:[
             { $Type: 'Common.ValueListParameterInOut', LocalDataProperty: 'CUST_ID', ValueListProperty: 'CUST_ID' },
             { $Type: 'Common.ValueListParameterDisplayOnly', ValueListProperty: 'COMPANY_NAME' }
        ]
    };
} ;

//Drop down Value
annotate service.SalesOrderSet with {
    OVERALL_STATUS @Common.ValueList: {
        CollectionPath: 'SalesOrderSet',
        Parameters:[
             { $Type: 'Common.ValueListParameterInOut', LocalDataProperty: 'OVERALL_STATUS', ValueListProperty: 'OverallStatusText' }
             //{ $Type: 'Common.ValueListParameterDisplayOnly', ValueListProperty: 'OverallStatusText' }
        ]
    };
    OVERALL_STATUS @Common.ValueListWithFixedValues: true;
} ;



//If you want to display input field with Cust Id and Customer Name
annotate service.SalesItemsSet with {
    PRODUCT_ID @(
        Common.Text     : PRODUCT_ID.ProductName,
        ValueList.entity: service.ProductSet
    )
};

//Status with Description
annotate service.SalesOrderSet with {
    CUST_ID @(
        Common.Text     : CUST_ID.ADDRESS_GUID.NAME1,
        ValueList.entity: service.BusinessPartnerSet
    );
    OVERALL_STATUS @(Common.Text: OverallStatusText)
};

//Value help
@cds.odata.valuelist
annotate service.BusinessPartnerSet with @(UI.Identification: [{
    $Type: 'UI.DataField',
    Value: COMPANY_NAME,
}, ]);

@cds.odata.valuelist
annotate service.ProductSet with @(UI.Identification: [{
    $Type: 'UI.DataField',
    Value: ProductName,
}, ]);

annotate service.BusinessPartnerSet with {

COMPANY_NAME @UI.AdaptationHidden: true;

}