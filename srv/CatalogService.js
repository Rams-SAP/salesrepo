const cds = require('@sap/cds');

module.exports = cds.service.impl( async function () {

    const { SalesOrderSet,AddressSet  } = this.entities;

    this.before('CREATE', SalesOrderSet, async (req,resp)=>{
        const tx = cds.tx(req);
        const myData = await tx.read(SalesOrderSet).orderBy({
            "SO_ID": 'desc'
        }).limit(1);

        const lastOrder = myData.SO_ID;

        let nextNo = 1;
        if (myData.length && myData[0].SO_ID) {
            // Extract numeric part, increment, and pad with zeros
            const lastNum = parseInt(myData[0].SO_ID.replace(/\D/g, ''), 10);
            nextNo = lastNum + 1;
        }
        // Format as SO + zero-padded number (e.g., SO00050)
        req.data.SO_ID = `SO${String(nextNo).padStart(5, '0')}`;
       
    })


    this.after('READ',AddressSet,(req,res)=>{
        console.log(JSON.stringify(res));
    });

       //Default Values
       this.on('getOrderDefault', async(req, res)=>{
        try {
           return {OVERALL_STATUS: 'N'}
        } catch (error) {
            return "there is an error" + error.toString();
        }
    });

//When Submit the status will change to Delivered
    this.on('setDelivered', async(req,res)=>{
        try {
            
            const SO_ID = req.params[0];
            console.log("SO id was "+ JSON.stringify(SO_ID));
            const tx = cds.tx(req);
             await tx.update(SalesOrderSet).with({
                "OVERALL_STATUS": 'D'
            }).where(POID);
         //After modify, read the instance
         const reply = tx.read(SalesOrderSet).where(SO_ID);
            return reply;
        } catch (error) {
            return "there is an error" + error.toString();
        }
    })

});