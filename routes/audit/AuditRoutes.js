
const express = require('express');
const router = express.Router();
const bodyParser = require('body-parser');
var urlencodedParser = bodyParser.urlencoded({ extended: false });
const AuditController = require('../../controllers/audit/AuditController');
const StocksController = require("../../controllers/stock/StocksController");
const GenderController = require("../../controllers/menu/GenderController.js");


//Middle ware that is specific to this router
router.use(function timeLog(req, res, next) {
  next();
});

router.post("/inner_join_product_audit", urlencodedParser,  async function(
  request,
  response
) {
  let tableOne = "products";
  let tableTwo = "operations_audit";
  let joiningKey = "UserId";
  let searchColumn = "UserId";
  let searchValue = request.body.user_id;
  let fetch =  AuditController.innerJoinAuditAndProducts(
    tableOne,
    tableTwo,
    joiningKey,
    searchColumn,
    searchValue
  );
  fetch.then(function(result) {
    //var response_object={results:result}
    response.send(result);
  }, function(err) {
    console.log(err);
    response.send("An error occurred");
  })
});

module.exports = router;