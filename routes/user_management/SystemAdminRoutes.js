const express = require('express');
const router = express.Router();
const bodyParser = require('body-parser');
var urlencodedParser = bodyParser.urlencoded({ extended: false });
const SystemAdminController = require('../../controllers/user_management/SystemAdminController');
const ModelMaster = require("../../models/ModelMaster");



//Middle ware that is specific to this router
router.use(function timeLog(req, res, next) {

  next();
});

router.post('/system_admin_registration', urlencodedParser,function(request,response){

  var date = new Date();
  date.setHours(date.getHours() + 3);


  var	recordObject = {
    AdminFirstName: request.body.AdminFirstName,
    AdminMiddleName: request.body.AdminMiddleName,
    AdminSurname: request.body.AdminSurname,
    AdminPhoneNumber: request.body.AdminPhoneNumber,
    Email: request.body.Email,
    GenderId: request.body.GenderId,
    NationalId: request.body.NationalId,
    EncryptedPassword	: request.body.EncryptedPassword	,
    RegisteredDate: date



    // UserName:request.body.UserName,
    // UserEmail:request.body.UserEmail,
    // Password:request.body.Password
  };

  var myPromise = SystemAdminController.insert(recordObject);


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

router.post("/system_admin_login", urlencodedParser, function(
  request,
  response
) {
  var jsonObject_ = {
    AttemptedEmail: request.body.AttemptedEmail,
    AttemptedPassword: request.body.AttemptedPassword,
    AttemptedRoleCode: request.body.AttemptedRoleCode
  };

  var myCompanySystemSystemAdminControllerObjectPromise = SystemAdminController.login(
    jsonObject_
  );

  myCompanySystemSystemAdminControllerObjectPromise.then(
    function(result) {
      response.send(result);
    },
    function(err) {
      console.log(err);
      response.send("An error occurred");
    }
  );
});


router.post('/get_all_system_admin',urlencodedParser,function(request,response){

  var mySystemAdminControllerObjectPromise = SystemAdminController.selectAll();


  mySystemAdminControllerObjectPromise.then(function(result) {

    var response_object={results:result}
    response.send(response_object);
  }, function(err) {
    console.log(err);
    response.send("An error occurred");
  })

});






router.post('/update_system_admin',urlencodedParser,function(request,response){

  var date = new Date();
  date.setHours(date.getHours()+0);

  var	jsonObject_ = {

    AdminFirstName: request.body.AdminFirstName,
    AdminMiddleName: request.body.AdminMiddleName,
    AdminSurname: request.body.AdminSurname,
    AdminPhoneNumber: request.body.AdminPhoneNumber,
    Email: request.body.Email,
    GenderId: request.body.GenderId,
    NationalId: request.body.NationalId,
    EncryptedPassword	: request.body.EncryptedPassword	,
    RegisteredDate: date

  };


  var mySystemAdminControllerObjectPromise = SystemAdminController.batchUpdate(jsonObject_);


  mySystemAdminControllerObjectPromise.then(function(result) {

    var response_object={results:result}
    response.send(response_object);
  }, function(err) {
    response.send("An error occurred");
    console.log(err);
  })

});







router.post('/get_specific_system_admin',urlencodedParser,function(request,response){
  var mKey=request.body.column_name;
  //var mValue=parseInt(request.query.search_value, 10);
  var mValue=request.body.search_value;




  var mySystemAdminControllerObjectPromise = SystemAdminController.selectSpecific(mKey,mValue);


  mySystemAdminControllerObjectPromise.then(function(result) {

    var response_object={results:result}
    response.send(response_object);
  }, function(err) {
    response.send("An error occurred");
    console.log(err);
  })


});






router.post('/update_individual_system_admin',urlencodedParser,function(request,response){

  var column_name=request.body.ColumnName;
  var value_=request.body.ColumnValue;

  var date = new Date();
  date.setHours(date.getHours()+0);

  var	jsonObject_ = {

    AdminFirstName: request.body.AdminFirstName,
    AdminMiddleName: request.body.AdminMiddleName,
    AdminSurname: request.body.AdminSurname,
    AdminPhoneNumber: request.body.AdminPhoneNumber,
    Email: request.body.Email,
    GenderId: request.body.GenderId,
    NationalId: request.body.NationalId,
    EncryptedPassword	: request.body.EncryptedPassword	,
    RegisteredDate: date

  };


  var mySystemAdminControllerObjectPromise = SystemAdminController.individualUpdate(column_name,value_,jsonObject_);


  mySystemAdminControllerObjectPromise.then(function(result) {

    var response_object={results:result}
    response.send(response_object);
  }, function(err) {
    response.send("An error occurred");
    console.log(err);
  })

});



module.exports = router;
