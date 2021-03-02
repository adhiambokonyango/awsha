/*SON/2018-11-06 00:29 - DEVELOPMENT
This class is the roles table's route class.
It is initialized at the "Index.js" and is able to recieve
calls from the client and passes the calls down to the
"ProductController" class
*/



const express = require('express');
const router = express.Router();
const bodyParser = require('body-parser');
var urlencodedParser = bodyParser.urlencoded({ extended: false });
const ProductController = require('../../controllers/products/ProductController.js');
const LotsController = require('../../controllers/lots/LotsController');



//Middle ware that is specific to this router
router.use(function timeLog(req, res, next) {

  next();
});

router.post(
  "/update_individual_stock",
  urlencodedParser,
  function(request, response) {
    var column_name = request.body.ColumnName;
    var value_ = request.body.ColumnValue;

    var date = new Date();
    date.setHours(date.getHours() + 0);

    var jsonObject_ = {
      InStock: request.body.InStock,
    };

    var myPromise = ProductController.individualUpdate(
      value_,
      jsonObject_,
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


router.post(
  "/update_checked_out_stock",
  urlencodedParser,
  function(request, response) {
    var column_name = request.body.ColumnName;
    var value_ = request.body.ColumnValue;

    var date = new Date();
    date.setHours(date.getHours() + 0);

    var jsonObject_ = {
      CheckedOut: request.body.CheckedOut,
    };

    var myPromise = ProductController.update_checked_out_stock(
      value_,
      jsonObject_,
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


router.post('/add_products', urlencodedParser,async (request,response) =>{

  var	jsonObject_ = {

    UserId: request.body.UserId,
    ProductName:request.body.ProductName,
    Price:request.body.Price,
    InStock: 0,
    CheckedOut: 0,
    BuyingPrice: request.body.BuyingPrice,


  };
  var myPromise = ProductController.insert(jsonObject_);


  myPromise.then(function(result) {

    var response_object={results:result}
    response.send(response_object);
  }, function(err) {
    console.log(err);
    response.send("An error occurred");
  })

});


router.post('/get_all_products/:UserId',urlencodedParser,function(request,response){

  const user_id = request.params.UserId;

  var myPromise = ProductController.selectAllCreatedByUser(user_id);
  myPromise.then(function(result) {

    // var response_object={ results: result }
    var response_object = result;
    response.send(response_object);
      console.log(response_object);
  }, function(err) {
    console.log(err);
    response.send("An error occurred");
  })

});


router.post("/delete_individual_user_products", urlencodedParser, function(
  request,
  response
) {
  //var mValue=parseInt(request.body.search_value, 10);
  var value_ = request.body.ProductId;

  var UserId = request.body.UserId;

  var myPromise = ProductController.delete(
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


router.post('/edit_products/:ProductId',urlencodedParser,function(request,response){

  var date = new Date();
  date.setHours(date.getHours()+0);
  let product_id = request.params.ProductId;
  var	jsonObject_ = {

    ProductName:request.body.ProductName,
    Price:request.body.Price,
    BuyingPrice: request.body.BuyingPrice,

  };
  var myPromise = ProductController.edit(jsonObject_, product_id);
  myPromise.then(function(result) {
    var response_object={results:result}
    response.send(response_object);
    console.log(response_object)
  }, function(err) {
    response.send("An error occurred");
    console.log(err);
  })

});



router.post('/get_specific_products',urlencodedParser,function(request,response){
 // var mKey=request.body.column_name;
  //var mValue=parseInt(request.query.search_value, 10);
  var mValue=request.query.search_value;


  var myPromise = ProductController.selectSpecific(mValue);


  myPromise.then(function(result) {
    var response_object={results:result}
    response.send(response_object);
  }, function(err) {
    response.send("An error occurred");
    console.log(err);
  })


});


router.post('/update_products',urlencodedParser,function(request,response){

  var date = new Date();
  date.setHours(date.getHours()+0);
  var	jsonObject_ = {

    ProductName:request.body.ProductName,
    Price:request.body.Price,
    BuyingPrice: request.body.BuyingPrice,

  };
  var myPromise = ProductController.batchUpdate(jsonObject_);
  myPromise.then(function(result) {
    var response_object={results:result}
    response.send(response_object);
    console.log(response_object)
  }, function(err) {
    response.send("An error occurred");
    console.log(err);
  })

});



router.post('/update_individual_products',urlencodedParser,function(request,response){

  var column_name=request.body.ColumnName;
  var value_=request.body.ColumnValue;

  var date = new Date();
  date.setHours(date.getHours()+0);

  var	jsonObject_ = {




    UserId: request.body.UserId,
    ProductName:request.body.ProductName,
    Price:request.body.Price,
    InStock: 0,
    CheckedOut: 0,
    BuyingPrice: request.body.BuyingPrice,






  };


  var myPromise = ProductController.individual_record_update(column_name,value_,jsonObject_);


  myPromise.then(function(result) {

    var response_object={results:result}
    response.send(response_object);
  }, function(err) {
    response.send("An error occurred");
    console.log(err);
  })

});






router.post('/delete_individual_products',urlencodedParser,function(request,response){

  var column_name=request.body.column_name;
  //var mValue=parseInt(request.body.search_value, 10);
  var value_=request.body.search_value;

  var UserIdColumnName=request.body.UserIdColumnName;

  var UserId=request.body.UserId;


  var myPromise = ProductController.delete_user_specic_record(column_name,value_,UserIdColumnName,UserId);


  myPromise.then(function(result) {

    var response_object={results:result}
    response.send(response_object);
  }, function(err) {
    response.send("An error occurred");
    console.log(err);
  })

});






router.post('/get_number_of_products_records',urlencodedParser,function(request,response){

  var column_name=request.body.column_name;
  //var mValue=parseInt(request.body.search_value, 10);
  var value_=request.body.search_value;



  var myPromise = ProductController.get_number_of_records(column_name,value_);


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



  var myPromise = ProductController.user_specific_select_query(ColumnName,value_,UserIdColumnName,UserId);


  myPromise.then(function(result) {

    var response_object={results:result}
    response.send(response_object);
  }, function(err) {
    response.send("An error occurred");
    console.log(err);
  })

});






module.exports = router;
