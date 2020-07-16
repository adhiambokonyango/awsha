const express = require('express');
const router = express.Router();
const bodyParser = require('body-parser');
var urlencodedParser = bodyParser.urlencoded({ extended: false });
const OfficeAdminController = require('../../controllers/user_management/OfficeAdminController');
const ModelMaster = require("../../models/ModelMaster");



//Middle ware that is specific to this router
router.use(function timeLog(req, res, next) {

  next();
});

router.post('/office_admin_registration', urlencodedParser,function(request,response){

  var date = new Date();
  date.setHours(date.getHours() + 3);


  var	recordObject = {
    FirstName: request.body.FirstName,
    MiddleName: request.body.MiddleName,
    Surname: request.body.Surname,
    PhoneNumber: request.body.PhoneNumber,
    Email: request.body.Email,
    GenderId: request.body.GenderId,
    NationalId: request.body.NationalId,
    EncryptedPassword	: request.body.EncryptedPassword	,
    RegisteredDate: date



    // UserName:request.body.UserName,
    // UserEmail:request.body.UserEmail,
    // Password:request.body.Password
  };

  var myPromise = OfficeAdminController.insert(recordObject);


  myPromise.then(function(result) {

    var response_object={results:result}
    response.send(response_object);
  }, function(err) {
    console.log(err);
    response.send("An error occurred");
  })

});


router.get('/signup', function (req, res) {
  res.sendFile( __dirname + "/" + "form.html" );
})

router.post("/office_admin_login", urlencodedParser, function(
  request,
  response
) {
  var jsonObject_ = {
    AttemptedEmail: request.body.AttemptedEmail,
    AttemptedPassword: request.body.AttemptedPassword,
    AttemptedRoleCode: request.body.AttemptedRoleCode
  };

  var myCompanySystemOfficeAdminControllerObjectPromise = OfficeAdminController.login(
    jsonObject_
  );

  myCompanySystemOfficeAdminControllerObjectPromise.then(
    function(result) {
      response.send(result);
    },
    function(err) {
      console.log(err);
      response.send("An error occurred");
    }
  );
});


router.post('/get_all_office_admin',urlencodedParser,function(request,response){

  var myOfficeAdminControllerObjectPromise = OfficeAdminController.selectAll();


  myOfficeAdminControllerObjectPromise.then(function(result) {

    var response_object={results:result}
    response.send(response_object);
  }, function(err) {
    console.log(err);
    response.send("An error occurred");
  })

});






router.post('/update_office_admin',urlencodedParser,function(request,response){

  var date = new Date();
  date.setHours(date.getHours()+0);

  var	jsonObject_ = {

    FirstName: request.body.FirstName,
    MiddleName: request.body.MiddleName,
    Surname: request.body.Surname,
    PhoneNumber: request.body.PhoneNumber,
    Email: request.body.Email,
    GenderId: request.body.GenderId,
    NationalId: request.body.NationalId,
    EncryptedPassword	: request.body.EncryptedPassword	,
    RegisteredDate: date

  };


  var myOfficeAdminControllerObjectPromise = OfficeAdminController.batchUpdate(jsonObject_);


  myOfficeAdminControllerObjectPromise.then(function(result) {

    var response_object={results:result}
    response.send(response_object);
  }, function(err) {
    response.send("An error occurred");
    console.log(err);
  })

});







router.post('/get_specific_office_admin',urlencodedParser,function(request,response){
  var mKey=request.body.column_name;
  //var mValue=parseInt(request.query.search_value, 10);
  var mValue=request.body.search_value;




  var myOfficeAdminControllerObjectPromise = OfficeAdminController.selectSpecific(mKey,mValue);


  myOfficeAdminControllerObjectPromise.then(function(result) {

    var response_object={results:result}
    response.send(response_object);
  }, function(err) {
    response.send("An error occurred");
    console.log(err);
  })


});






router.post('/update_individual_office_admin',urlencodedParser,function(request,response){

  var column_name=request.body.ColumnName;
  var value_=request.body.ColumnValue;

  var date = new Date();
  date.setHours(date.getHours()+0);

  var	jsonObject_ = {

    FirstName: request.body.FirstName,
    MiddleName: request.body.MiddleName,
    Surname: request.body.Surname,
    PhoneNumber: request.body.PhoneNumber,
    Email: request.body.Email,
    GenderId: request.body.GenderId,
    NationalId: request.body.NationalId,
    EncryptedPassword	: request.body.EncryptedPassword	,
    RegisteredDate: date

  };


  var myOfficeAdminControllerObjectPromise = OfficeAdminController.individualUpdate(column_name,value_,jsonObject_);


  myOfficeAdminControllerObjectPromise.then(function(result) {

    var response_object={results:result}
    response.send(response_object);
  }, function(err) {
    response.send("An error occurred");
    console.log(err);
  })

});



module.exports = router;
