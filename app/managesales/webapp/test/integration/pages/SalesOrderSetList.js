sap.ui.define(['sap/fe/test/ListReport'], function(ListReport) {
    'use strict';

    var CustomPageDefinitions = {
        actions: {},
        assertions: {}
    };

    return new ListReport(
        {
            appId: 'com.sales.order.managesales',
            componentId: 'SalesOrderSetList',
            contextPath: '/SalesOrderSet'
        },
        CustomPageDefinitions
    );
});