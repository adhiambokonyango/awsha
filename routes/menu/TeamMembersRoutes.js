/*SON/2018-11-06 00:29 - DEVELOPMENT
This class is the team_members table's route class.
It is initialized at the "Index.js" and is able to recieve
calls from the client and passes the calls down to the
"TeamMembersController" class
*/



const express = require('express');
const router = express.Router();
const bodyParser = require('body-parser');
var urlencodedParser = bodyParser.urlencoded({ extended: false });
const TeamMembersController = require('../../controllers/menu/TeamMembersController.js');



//Middle ware that is specific to this router
router.use(function timeLog(req, res, next) {

  next();
});



// router.post('/add_team_members', urlencodedParser,function(request,response){
//
//
//
//   var	jsonObject_ = {
//
//
//
//     TeamMemberName:request.body.TeamMemberName,
//     TeamMemberEmail:request.body.TeamMemberEmail,
//     TeamMemberPassword:request.body.TeamMemberPassword,
//     TeamId:request.body.TeamId,
//     CompanyId:request.body.CompanyId
//
//
//   };
//
//
//   var myPromise = TeamMembersController.insert(jsonObject_);
//
//
//   myPromise.then(function(result) {
//
//     var response_object={results:result}
//     response.send(response_object);
//   }, function(err) {
//     console.log(err);
//     response.send("An error occurred");
//   })
//
// });


router.post("/team_members_registration", urlencodedParser, function(
  request,
  response
) {

  var date = new Date();
  date.setHours(date.getHours() + 3);
  var jsonObject_ = {
    TeamMemberName:request.body.TeamMemberName,
    TeamMemberEmail:request.body.TeamMemberEmail,
    TeamId:request.body.TeamId,
    CompanyId:request.body.CompanyId,
    GenderId: request.body.GenderId,
    TeamMemberNationalId: request.body.TeamMemberNationalId,
    EncryptedPassword	: request.body.EncryptedPassword	,
    RegisteredDate: date
  };

  var myTeamMembersControllerObjectPromise = TeamMembersController.insert(
    jsonObject_
  );

  myTeamMembersControllerObjectPromise.then(
    function(result) {
      var response_object = { results: result };
      response.send(response_object);
    },
    function(err) {
      console.log(err);
      response.send("An error occurred");
    }
  );
});

router.post("/team_members_login", urlencodedParser, function(
  request,
  response
) {
  var jsonObject_ = {
    AttemptedEmail: request.body.AttemptedEmail,
    AttemptedPassword: request.body.AttemptedPassword
  };

  var myTeamMembersControllerObjectPromise = TeamMembersController.user_login(
    jsonObject_
  );

  myTeamMembersControllerObjectPromise.then(
    function(result) {
      response.send(result);
    },
    function(err) {
      console.log(err);
      response.send("An error occurred");
    }
  );

});






router.post('/get_all_team_members',urlencodedParser,function(request,response){

  var myPromise = TeamMembersController.get_all_records();


  myPromise.then(function(result) {

    var response_object={results:result}
    response.send(response_object);
  }, function(err) {
    console.log(err);
    response.send("An error occurred");
  })

});









router.post('/get_specific_team_members',urlencodedParser,function(request,response){
  var mKey=request.body.column_name;
  //var mValue=parseInt(request.query.search_value, 10);
  var mValue=request.body.search_value;




  var myPromise = TeamMembersController.get_specific_records(mKey,mValue);


  myPromise.then(function(result) {
    var response_object={results:result}
    response.send(response_object);
  }, function(err) {
    response.send("An error occurred");
    console.log(err);
  })


});













router.post('/update_team_members',urlencodedParser,function(request,response){


  var	jsonObject_ = {



    TeamMemberName:request.body.TeamMemberName,
    TeamMemberEmail:request.body.TeamMemberEmail,
    TeamId:request.body.TeamId,
    CompanyId:request.body.CompanyId,
    GenderId: request.body.GenderId,
    TeamMemberNationalId: request.body.TeamMemberNationalId,
    EncryptedPassword	: request.body.EncryptedPassword	,
    RegisteredDate: date


  };



  var myPromise = TeamMembersController.batch_update(jsonObject_);


  myPromise.then(function(result) {

    var response_object={results:result}
    response.send(response_object);
  }, function(err) {
    response.send("An error occurred");
    console.log(err);
  })

});








router.post('/update_individual_team_members',urlencodedParser,function(request,response){

  var column_name=request.body.ColumnName;
  var value_=request.body.ColumnValue;


  var	jsonObject_ = {



    TeamMemberName:request.body.TeamMemberName,
    TeamMemberEmail:request.body.TeamMemberEmail,
    TeamId:request.body.TeamId,
    CompanyId:request.body.CompanyId,
    GenderId: request.body.GenderId,
    TeamMemberNationalId: request.body.TeamMemberNationalId,
    EncryptedPassword	: request.body.EncryptedPassword	,
    RegisteredDate: date


  };


  var myPromise = TeamMembersController.individual_record_update(column_name,value_,jsonObject_);


  myPromise.then(function(result) {

    var response_object={results:result}
    response.send(response_object);
  }, function(err) {
    response.send("An error occurred");
    console.log(err);
  })

});






router.post('/delete_individual_team_members',urlencodedParser,function(request,response){

  var column_name=request.body.column_name;
  //var mValue=parseInt(request.body.search_value, 10);
  var value_=request.body.search_value;

  var UserIdColumnName=request.body.UserIdColumnName;

  var UserId=request.body.UserId;


  var myPromise = TeamMembersController.delete_user_specic_record(column_name,value_,UserIdColumnName,UserId);


  myPromise.then(function(result) {

    var response_object={results:result}
    response.send(response_object);
  }, function(err) {
    response.send("An error occurred");
    console.log(err);
  })

});






router.post('/get_number_of_team_members_records',urlencodedParser,function(request,response){

  var column_name=request.body.column_name;
  //var mValue=parseInt(request.body.search_value, 10);
  var value_=request.body.search_value;



  var myPromise = TeamMembersController.get_number_of_records(column_name,value_);


  myPromise.then(function(result) {

    var response_object={results:result}
    response.send(response_object);
  }, function(err) {
    response.send("An error occurred");
    console.log(err);
  })

});







router.post('/team_members_user_specific_query',urlencodedParser,function(request,response){

  var ColumnName=request.body.ColumnName;
  //var mValue=parseInt(request.body.search_value, 10);
  var value_=request.body.value_;

  var UserIdColumnName=request.body.UserIdColumnName;

  var UserId=request.body.UserId;



  var myPromise = TeamMembersController.user_specific_select_query(ColumnName,value_,UserIdColumnName,UserId);


  myPromise.then(function(result) {

    var response_object={results:result}
    response.send(response_object);
  }, function(err) {
    response.send("An error occurred");
    console.log(err);
  })

});






module.exports = router;