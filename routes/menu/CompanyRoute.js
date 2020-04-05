/*SON/2018-11-06 00:29 - DEVELOPMENT
This class is the company table's route class.
It is initialized at the "Index.js" and is able to recieve
calls from the client and passes the calls down to the
"CompanyController" class
*/



const express = require('express');
const router = express.Router();
const bodyParser = require('body-parser');
var urlencodedParser = bodyParser.urlencoded({ extended: false });
const CompanyController = require('../../controllers/menu/CompanyController.js');



//Middle ware that is specific to this router
router.use(function timeLog(req, res, next) {

  next();
});



router.post('/add_company', urlencodedParser,function(request,response){



  var	jsonObject_ = {


    CompanyName:request.body.CompanyName,
    CompanyEmail:request.body.CompanyEmail,
    CompanyPostalAdress:request.body.CompanyPostalAdress,
    CompanyLocation:request.body.CompanyLocation,
    CompanyTelephone:request.body.CompanyTelephone,
    CompanyMission:request.body.CompanyMission,
    CompanyVision:request.body.CompanyVision,
    CompanyAbout:request.body.CompanyAbout,
    CompanyVacancy:request.body.CompanyVacancy


  };


  var myPromise = CompanyController.insert(jsonObject_);


  myPromise.then(function(result) {

    var response_object={results:result}
    response.send(response_object);
  }, function(err) {
    console.log(err);
    response.send("An error occurred");
  })

});






router.post('/get_all_company',urlencodedParser,function(request,response){

  var myPromise = CompanyController.get_all_records();


  myPromise.then(function(result) {

    var response_object={results:result}
    response.send(response_object);
  }, function(err) {
    console.log(err);
    response.send("An error occurred");
  })

});









router.post('/get_specific_company',urlencodedParser,function(request,response){
  var mKey=request.body.column_name;
  //var mValue=parseInt(request.query.search_value, 10);
  var mValue=request.body.search_value;




  var myPromise = CompanyController.get_specific_records(mKey,mValue);


  myPromise.then(function(result) {
    var response_object={results:result}
    response.send(response_object);
  }, function(err) {
    response.send("An error occurred");
    console.log(err);
  })


});













router.post('/update_company',urlencodedParser,function(request,response){


  var	jsonObject_ = {


    CompanyId:request.body.CompanyId,
    CompanyName:request.body.CompanyName,
    CompanyEmail:request.body.CompanyEmail,
    CompanyPostalAdress:request.body.CompanyPostalAdress,
    CompanyLocation:request.body.CompanyLocation,
    CompanyTelephone:request.body.CompanyTelephone,
    CompanyMission:request.body.CompanyMission,
    CompanyVision:request.body.CompanyVision,
    CompanyAbout:request.body.CompanyAbout,
    CompanyVacancy:request.body.CompanyVacancy


  };



  var myPromise = CompanyController.batch_update(jsonObject_);


  myPromise.then(function(result) {

    var response_object={results:result}
    response.send(response_object);
  }, function(err) {
    response.send("An error occurred");
    console.log(err);
  })

});








router.post('/update_individual_company',urlencodedParser,function(request,response){

  var column_name=request.body.ColumnName;
  var value_=request.body.ColumnValue;


  var	jsonObject_ = {


    CompanyId:request.body.CompanyId,
    CompanyName:request.body.CompanyName,
    CompanyEmail:request.body.CompanyEmail,
    CompanyPostalAdress:request.body.CompanyPostalAdress,
    CompanyLocation:request.body.CompanyLocation,
    CompanyTelephone:request.body.CompanyTelephone,
    CompanyMission:request.body.CompanyMission,
    CompanyVision:request.body.CompanyVision,
    CompanyAbout:request.body.CompanyAbout,
    CompanyVacancy:request.body.CompanyVacancy


  };


  var myPromise = CompanyController.individual_record_update(column_name,value_,jsonObject_);


  myPromise.then(function(result) {

    var response_object={results:result}
    response.send(response_object);
  }, function(err) {
    response.send("An error occurred");
    console.log(err);
  })

});






router.post('/delete_individual_company',urlencodedParser,function(request,response){

  var column_name=request.body.column_name;
  //var mValue=parseInt(request.body.search_value, 10);
  var value_=request.body.search_value;

  var UserIdColumnName=request.body.UserIdColumnName;

  var UserId=request.body.UserId;


  var myPromise = CompanyController.delete_user_specic_record(column_name,value_,UserIdColumnName,UserId);


  myPromise.then(function(result) {

    var response_object={results:result}
    response.send(response_object);
  }, function(err) {
    response.send("An error occurred");
    console.log(err);
  })

});






router.post('/get_number_of_company_records',urlencodedParser,function(request,response){

  var column_name=request.body.column_name;
  //var mValue=parseInt(request.body.search_value, 10);
  var value_=request.body.search_value;



  var myPromise = CompanyController.get_number_of_records(column_name,value_);


  myPromise.then(function(result) {

    var response_object={results:result}
    response.send(response_object);
  }, function(err) {
    response.send("An error occurred");
    console.log(err);
  })

});







router.post('/company_user_specific_query',urlencodedParser,function(request,response){

  var ColumnName=request.body.ColumnName;
  //var mValue=parseInt(request.body.search_value, 10);
  var value_=request.body.value_;

  var UserIdColumnName=request.body.UserIdColumnName;

  var UserId=request.body.UserId;



  var myPromise = CompanyController.user_specific_select_query(ColumnName,value_,UserIdColumnName,UserId);


  myPromise.then(function(result) {

    var response_object={results:result}
    response.send(response_object);
  }, function(err) {
    response.send("An error occurred");
    console.log(err);
  })

});






module.exports = router;