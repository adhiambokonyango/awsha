/*SON/2018-11-06 00:29 - DEVELOPMENT
This class is the Company table's route class.
It is initialized at the "Index.js" and is able to recieve
calls from the client and passes the calls down to the
"AgentController" class
*/


const express = require('express');
const router = express.Router();
const bodyParser = require('body-parser');
var urlencodedParser = bodyParser.urlencoded({ extended: false });
const StocksController = require('../../controllers/stock/StocksController');


//Middle ware that is specific to this router
router.use(function timeLog(req, res, next) {
  next();
});


router.post("/inner_join_product_stock", urlencodedParser,  async function(
  request,
  response
) {
  let user_id = request.body.UserId;
  let fetch = await StocksController.fetch_stocks(user_id);

  response.send({
    fetch
  });
});


module.exports = router;