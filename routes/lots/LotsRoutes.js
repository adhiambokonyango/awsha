/*SON/2018-11-06 00:29 - DEVELOPMENT
This class is the lots table's route class.
It is initialized at the "Index.js" and is able to recieve
calls from the client and passes the calls down to the
"LotsController" class
*/



const express = require('express');
const router = express.Router();
const bodyParser = require('body-parser');
var urlencodedParser = bodyParser.urlencoded({ extended: false });
const LotsController = require('../../controllers/lots/LotsController.js');

const schedule = require('node-schedule');

//Middle ware that is specific to this router
router.use(function timeLog(req, res, next) {

  next();
});



router.post('/add_lots', urlencodedParser,function(request,response){

// var date = new Date();
//     date.setHours(date.getHours() + 3);

  var date = new Date();
  date.setHours(date.getHours() + 3);

  var	jsonObject_ = {

    ProductId: request.body.ProductId,
    UserId: request.body.UserId,
    RegisteredDate:date,
    ExpiryDate:request.body.ExpiryDate,
    ItemCount: 0,
    ExpiredItemCount: 0,
    Expired: 0,
    CountOfCheckedOutItems: 0,
    Depleted: 0

  };


  var myPromise = LotsController.insert(jsonObject_);


  myPromise.then(function(result) {

    //var response_object={results:result}
     var response_object=result;
    response.send(response_object);
    console.log(response_object);
  }, function(err) {
    console.log(err);
    response.send("An error occurred");
  })

});


router.post('/select_all',urlencodedParser,function(request,response){
  const user_id = request.body.UserId;
  var myPromise = LotsController.stocks_report(user_id);
  myPromise.then(function(result) {

    //var response_object={results:result}
    var response_object=result;
    response.send(response_object);

    console.log(response_object);
    console.log(request.headers)
  }, function(err) {
    console.log(err);
    response.send("An error occurred");
  })

});


router.post('/get_specific_lot',urlencodedParser,function(request,response){
  //var mKey=request.body.column_name;
  //var mValue=parseInt(request.query.search_value, 10);
  var fValue=request.body.LotId;
  var sValue=request.body.UserId;
  var myPromise = LotsController.getSpecificCode(fValue, sValue);
  myPromise.then(function(result) {
    // var response_object={results:result}
    var response_object=result;
    response.send(response_object);
  }, function(err) {
    response.send("An error occurred");
    console.log(err);
  })
});

router.post('/depleted_stock',urlencodedParser,function(request,response){
  const user_id = request.body.UserId;
  var myPromise = LotsController.depletedStock(user_id);
  myPromise.then(function(result) {

    //var response_object={results:result}
    var response_object=result;
    response.send(response_object);
    console.log(response_object);
  }, function(err) {
    console.log(err);
    response.send("An error occurred");
  })

});

router.post("/delete_individual_user_lots", urlencodedParser, function(
  request,
  response
) {
  //var mValue=parseInt(request.body.search_value, 10);
  var value_ = request.body.LotId;

  var UserId = request.body.UserId;

  var myPromise = LotsController.delete(
    value_,
    UserId
  );

  myPromise.then(
    function(result) {
      //  var response_object = { results: result };
      var response_object = result ;
      response.send(response_object);
      console.log(response_object);
    },
    function(err) {
      response.send("An error occurred");
      console.log(err);
    }
  );
});


router.post('/get_lot_expiry_period',urlencodedParser,function(request,response){
var lotId = request.body.LotId;
  var myPromise = LotsController.expired(lotId);
  myPromise.then(function(result) {

    //var response_object={results:result}
    var response_object=result;
    response.send(response_object);
    console.log(response_object);
  }, function(err) {
    console.log(err);
    response.send("An error occurred");
  })

});


router.post('/get_specific',urlencodedParser,function(request,response){
  var mKey=request.body.column_name;
  //var mValue=parseInt(request.query.search_value, 10);
  var mValue=request.body.search_value;

  var myPromise = LotsController.selectSpecific(mKey,mValue);


  myPromise.then(function(result) {
    var response_object={results:result}
    response.send(response_object);
    console.log(response_object);

  }, function(err) {
    response.send("An error occurred");
    console.log(err);
  })


});













router.post('/update_lots',urlencodedParser,function(request,response){


  var date = new Date();
   date.setHours(date.getHours()+0);
 // date.setFullYear(date.getFullYear()+0);

  var	jsonObject_ = {


    ProductId: request.body.ProductId,
    UserId: request.body.UserId,
    RegisteredDate:date,
    ExpiryDate:request.body.ExpiryDate,
    ItemCount: 0,
    ExpiredItemCount: 0,
    Expired: 0,
    CountOfCheckedOutItems: 0,
    Depleted: 0






  };


  var myPromise = LotsController.batch_update(jsonObject_);


  myPromise.then(function(result) {

    var response_object={results:result}
    response.send(response_object);
  }, function(err) {
    response.send("An error occurred");
    console.log(err);
  })

});








router.post('/update_individual_lots',urlencodedParser,function(request,response){

  var column_name=request.body.ColumnName;
  var value_=request.body.ColumnValue;

  var date = new Date();
 // date.setHours(date.getHours()+0);
  date.setFullYear(date.getFullYear()+0);

  var	jsonObject_ = {


    ProductId: request.body.ProductId,
    UserId: request.body.UserId,
    RegisteredDate:date,
    ExpiryDate:request.body.ExpiryDate,
    ItemCount: 0,
    ExpiredItemCount: 0,
    Expired: 0,
    CountOfCheckedOutItems: 0,
    Depleted: 0



  };


  var myPromise = LotsController.individual_record_update(column_name,value_,jsonObject_);


  myPromise.then(function(result) {

    var response_object={results:result}
    response.send(response_object);
  }, function(err) {
    response.send("An error occurred");
    console.log(err);
  })

});






router.post('/delete_individual_lots',urlencodedParser,function(request,response){

  var column_name=request.body.column_name;
  //var mValue=parseInt(request.body.search_value, 10);
  var value_=request.body.search_value;

  var UserIdColumnName=request.body.UserIdColumnName;

  var UserId=request.body.UserId;


  var myPromise = LotsController.delete_user_specic_record(column_name,value_,UserIdColumnName,UserId);


  myPromise.then(function(result) {

    var response_object={results:result}
    response.send(response_object);
  }, function(err) {
    response.send("An error occurred");
    console.log(err);
  })

});






router.post('/get_number_of_lots_records',urlencodedParser,function(request,response){

  var column_name=request.body.column_name;
  //var mValue=parseInt(request.body.search_value, 10);
  var value_=request.body.search_value;



  var myPromise = LotsController.get_number_of_records(column_name,value_);


  myPromise.then(function(result) {

    var response_object={results:result}
    response.send(response_object);
  }, function(err) {
    response.send("An error occurred");
    console.log(err);
  })

});







router.post('/lots_user_specific_query',urlencodedParser,function(request,response){

  var ColumnName=request.body.ColumnName;
  //var mValue=parseInt(request.body.search_value, 10);
  var value_=request.body.value_;

  var UserIdColumnName=request.body.UserIdColumnName;

  var UserId=request.body.UserId;



  var myPromise = LotsController.user_specific_select_query(ColumnName,value_,UserIdColumnName,UserId);


  myPromise.then(function(result) {

    var response_object={results:result}
    response.send(response_object);
  }, function(err) {
    response.send("An error occurred");
    console.log(err);
  })

});


module.exports = router;
