sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'com/sales/order/managesales/test/integration/FirstJourney',
		'com/sales/order/managesales/test/integration/pages/SalesOrderSetList',
		'com/sales/order/managesales/test/integration/pages/SalesOrderSetObjectPage',
		'com/sales/order/managesales/test/integration/pages/SalesItemsSetObjectPage'
    ],
    function(JourneyRunner, opaJourney, SalesOrderSetList, SalesOrderSetObjectPage, SalesItemsSetObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('com/sales/order/managesales') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheSalesOrderSetList: SalesOrderSetList,
					onTheSalesOrderSetObjectPage: SalesOrderSetObjectPage,
					onTheSalesItemsSetObjectPage: SalesItemsSetObjectPage
                }
            },
            opaJourney.run
        );
    }
);