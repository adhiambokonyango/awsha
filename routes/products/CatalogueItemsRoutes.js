/*SON/2018-11-06 00:29 - DEVELOPMENT
This class is the roles table's route class.
It is initialized at the "Index.js" and is able to recieve
calls from the client and passes the calls down to the
"CatalogueItemsController" class
*/



const express = require('express');
const router = express.Router();
const bodyParser = require('body-parser');
var urlencodedParser = bodyParser.urlencoded({ extended: false });
const CatalogueItemsController = require('../../controllers/products/CatalogueItemsController.js');
const Repository = require("../../controllers/Repository");


//Middle ware that is specific to this router
router.use(function timeLog(req, res, next) {

  next();
});

// update_status_for_checked_out_catalogue_item
router.post(
  "/update_status_for_checked_out_catalogue_item",
  urlencodedParser,
  function(request, response) {
    var column_name = request.body.ColumnName;
    var value_ = request.body.ColumnValue;

    var date = new Date();
    date.setHours(date.getHours() + 0);


    var myPromise = CatalogueItemsController.update_status_for_checked_out_catalogue_item(
      value_,
      column_name
    );

    myPromise.then(
      function(result) {
        //  var response_object = { results: result };
        var response_object =  result ;
        response.send(response_object);
        console.log(response_object);
      },
      function(err) {
        response.send("An error occurred");
        console.log(err);
      }
    );
  }
);
// end

//insert unique code
router.post('/add_unique_code',urlencodedParser, async (request,response) => {
  var date = new Date();
  date.setHours(date.getHours()+0);
  var	jsonObject_ = {
    ProductId: request.body.ProductId,
    LotId: request.body.LotId,
    Code: request.body.Code,
    Status:0,
    ExpiryStatus:0,
    RegisteredDate:date,
    Counter: 1
  };
    var myPromise =  CatalogueItemsController.insert_unique_catalogue_item(jsonObject_);
  myPromise.then(function(
    result) {
   // var response_object={results:result}
    var response_object=result;
    response.send(response_object);
    console.log(response_object);
  }, function(err) {
    console.log(err);
    response.send("An error occurred");
  })
 // console.log(myPromise);
});

// insert existing code
router.post('/insert_existing_code',urlencodedParser, async (request,response) => {
  var date = new Date();
  date.setHours(date.getHours()+0);
  var	jsonObject_ = {
    Code: request.body.Code,
    ProductId: request.body.ProductId
  };
  var myPromise =  CatalogueItemsController.insert_existing_code(jsonObject_);
  myPromise.then(function(
    result) {
    // var response_object={results:result}
    var response_object=result;
    response.send(response_object);
    console.log(response_object);
  }, function(err) {
    console.log(err);
    response.send("An error occurred");
  })
  // response.send(myPromise);
  // console.log(myPromise);
});
// end


// check_back_in
router.post('/check_back_in',urlencodedParser, async (request,response) => {
  var date = new Date();
  date.setHours(date.getHours()+0);
  var	jsonObject_ = {
    Code: request.body.Code,
    ProductId: request.body.ProductId
  };
  var myPromise =  CatalogueItemsController.check_back_in_existing_code(jsonObject_);
  myPromise.then(function(
    result) {
    // var response_object={results:result}
    var response_object=result;
    response.send(response_object);
    console.log(response_object);
  }, function(err) {
    console.log(err);
    response.send("An error occurred");
  })
  // response.send(myPromise);
  // console.log(myPromise);
});
// end



// check_out_old_stock
router.post('/check_out_old_stock',urlencodedParser, async (request,response) => {
  var date = new Date();
  date.setHours(date.getHours()+0);
  var	jsonObject_ = {
    Code: request.body.Code
  };
  var myPromise =  CatalogueItemsController.check_out_old_stock(jsonObject_);
  myPromise.then(function(
    result) {
    // var response_object={results:result}
    var response_object=result;
    response.send(response_object);
    console.log(response_object);
  }, function(err) {
    console.log(err);
    response.send("An error occurred");
  })
  // response.send(myPromise);
  // console.log(myPromise);
});
// end



//scanner
router.post('/add_catalogue_items',urlencodedParser, async (request,response) => {
  var date = new Date();
  date.setHours(date.getHours()+0);
  let jsonObject = {
    ProductId: request.body.ProductId,
    LotId: request.body.LotId,
    Code: request.body.Code,
    Status:0,
    ExpiryStatus:0,
    RegisteredDate:date,
    Counter: 1
  };
  let result = await Repository.insert_mobile_user("catalogue_items",jsonObject);
  response.send(result);
});


router.post('/insert_catalogue_items', urlencodedParser,function(request,response){
  var date = new Date();
  date.setHours(date.getHours() + 3);
  var	jsonObject_ = {

    ProductId: request.body.ProductId,
    LotId: request.body.LotId,
    Code: request.body.Code,
    Status:0,
    ExpiryStatus:0,
    RegisteredDate:date,
    Counter: 1

  };
  var myPromise = CatalogueItemsController.insert(jsonObject_);
  myPromise.then(function(result) {
    var response_object={results:result}
    response.send(response_object);
  }, function(err) {
    console.log(err);
    response.send("An error occurred");
  })

});

router.post('/get_all_catalogue_items',urlencodedParser,function(request,response){

  var myPromise = CatalogueItemsController.detail_fetch();


  myPromise.then(function(result) {

  //  var response_object={results:result}
   var response_object=result
    response.send(response_object);
    console.log(response_object)
  }, function(err) {
    console.log(err);
    response.send("An error occurred");
  })

});

// router.post('/get_stock_records',urlencodedParser,function(request,response){
//
//   //var mValue=parseInt(request.body.search_value, 10);
//   var value_=request.body.ProductId;
//   var Status=request.body.Status;
//   var myPromise = CatalogueItemsController.get_stock_records( value_, Status);
//   myPromise.then(function(result) {
//     var response_object={results:result}
//     response.send(response_object);
//     console.log(response_object);
//   }, function(err) {
//     response.send("An error occurred");
//     console.log(err);
//   })
// });


// fetch code in_stock
router.post('/fetch_stock_records',urlencodedParser,async (request,response)=>{
  //var mValue=parseInt(request.body.search_value, 10);
  var value_=request.body.ProductId;
  var myPromise =  CatalogueItemsController.get_stock_records(value_);
  myPromise.then(function(result) {
   // var response_object={results:result}
  var response_object= result
    response.send(response_object);
    console.log(response_object);
  }, function(err) {
    response.send("An error occurred");
    console.log(err);
  })
  // response.send(myPromise);
  // console.log(myPromise)
});
// end


// fetch code get_checked_out_records
router.post('/get_checked_out_records',urlencodedParser,async (request,response)=>{
  //var mValue=parseInt(request.body.search_value, 10);
  var value_=request.body.ProductId;
  var myPromise = CatalogueItemsController.get_checked_out_records(value_);
  myPromise.then(function(result) {
   // var response_object={results:result}
  var response_object= result
    response.send(response_object);
    console.log(response_object);
  }, function(err) {
    response.send("An error occurred");
    console.log(err);
  })
  // response.send(myPromise);
  // console.log(myPromise)
});
// end


router.post('/get_specific_catalogue_items',urlencodedParser,function(request,response){
  var mKey=request.body.column_name;
  //var mValue=parseInt(request.query.search_value, 10);
  var mValue=request.body.search_value;




  var myPromise = CatalogueItemsController.selectSpecific(mKey,mValue);


  myPromise.then(function(result) {
    var response_object={results:result}
    response.send(response_object);
  }, function(err) {
    response.send("An error occurred");
    console.log(err);
  })


});

router.post('/update_catalogue_items',urlencodedParser,function(request,response){


  var date = new Date();
  date.setHours(date.getHours()+0);

  var	jsonObject_ = {




    ProductId: request.body.ProductId,
    LotId: request.body.LotId,
    Code: request.body.Code,
    Status:0,
    ExpiryStatus:0,
    RegisteredDate:date,
    Counter: 1







  };


  var myPromise = CatalogueItemsController.batchUpdate(jsonObject_);


  myPromise.then(function(result) {

    var response_object={results:result}
    response.send(response_object);
  }, function(err) {
    response.send("An error occurred");
    console.log(err);
  })

});








router.post('/update_individual_catalogue_items',urlencodedParser,function(request,response){

  var column_name=request.body.ColumnName;
  var value_=request.body.ColumnValue;

  var date = new Date();
  date.setHours(date.getHours()+0);

  var	jsonObject_ = {




    ProductId: request.body.ProductId,
    LotId: request.body.LotId,
    Code: request.body.Code,
    Status:0,
    ExpiryStatus:0,
    RegisteredDate:date,
    Counter: 1






  };


  var myPromise = CatalogueItemsController.individual_record_update(column_name,value_,jsonObject_);


  myPromise.then(function(result) {

    var response_object={results:result}
    response.send(response_object);
  }, function(err) {
    response.send("An error occurred");
    console.log(err);
  })

});






router.post('/delete_individual_catalogue_items',urlencodedParser,function(request,response){

  var column_name=request.body.column_name;
  //var mValue=parseInt(request.body.search_value, 10);
  var value_=request.body.search_value;

  var UserIdColumnName=request.body.UserIdColumnName;

  var UserId=request.body.UserId;


  var myPromise = CatalogueItemsController.delete_user_specic_record(column_name,value_,UserIdColumnName,UserId);


  myPromise.then(function(result) {

    var response_object={results:result}
    response.send(response_object);
  }, function(err) {
    response.send("An error occurred");
    console.log(err);
  })

});






router.post('/get_number_of_catalogue_items_records',urlencodedParser,function(request,response){

  var column_name=request.body.column_name;
  //var mValue=parseInt(request.body.search_value, 10);
  var value_=request.body.search_value;



  var myPromise = CatalogueItemsController.get_number_of_records(column_name,value_);


  myPromise.then(function(result) {

    var response_object={results:result}
    response.send(response_object);
  }, function(err) {
    response.send("An error occurred");
    console.log(err);
  })

});







router.post('/roles_user_specific_query',urlencodedParser,function(request,response){

  var ColumnName=request.body.ColumnName;
  //var mValue=parseInt(request.body.search_value, 10);
  var value_=request.body.value_;

  var UserIdColumnName=request.body.UserIdColumnName;

  var UserId=request.body.UserId;



  var myPromise = CatalogueItemsController.user_specific_select_query(ColumnName,value_,UserIdColumnName,UserId);


  myPromise.then(function(result) {

    var response_object={results:result}
    response.send(response_object);
  }, function(err) {
    response.send("An error occurred");
    console.log(err);
  })

});






module.exports = router;
