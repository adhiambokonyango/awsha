/*SON/2018-11-06 00:29 - DEVELOPMENT

This class is the admins table's route class.
It is initialized at the "Index.js" and is able to recieve
calls from the client and passes the calls down to the
"TeamMembersController" class

*/


const express = require("express");
const router = express.Router();
const bodyParser = require("body-parser");
var urlencodedParser = bodyParser.urlencoded({ extended: false });
const TeamMembersController = require("../../controllers/menu/TeamMembersController.js");

//Middle ware that is specific to this router
router.use(function timeLog(req, res, next) {
  next();
});




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

  var myTeamMembersControllerObjectPromise = TeamMembersController.insert_users(
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

router.get("/admin_registration_form", function(req, res) {
  res.sendFile(__dirname + "/" + "AdminRegistration.html");
});

router.get("/admin_login", function(req, res) {
  res.sendFile(__dirname + "/" + "AdminLogin.html");
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

router.post("/get_all_team_members", urlencodedParser, function(
  request,
  response
) {
  var myTeamMembersControllerObjectPromise = TeamMembersController.get_all_admin();

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

router.post("/update_team_members", urlencodedParser, function(
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

  var myTeamMembersControllerObjectPromise = TeamMembersController.batch_admins_update(
    jsonObject_
  );

  myTeamMembersControllerObjectPromise.then(
    function(result) {
      var response_object = { results: result };
      response.send(response_object);
    },
    function(err) {
      response.send("An error occurred");
      console.log(err);
    }
  );
});

router.post("/get_specific_team_members", urlencodedParser, function(
  request,
  response
) {
  var mKey = request.body.column_name;
  //var mValue=parseInt(request.query.search_value, 10);
  var mValue = request.body.search_value;

  var myTeamMembersControllerObjectPromise = TeamMembersController.get_specific_admins(
    mKey,
    mValue
  );

  myTeamMembersControllerObjectPromise.then(
    function(result) {
      var response_object = { results: result };
      response.send(response_object);
    },
    function(err) {
      response.send("An error occurred");
      console.log(err);
    }
  );
});

router.post("/update_individual_team_members", urlencodedParser, function(
  request,
  response
) {
  var column_name = request.body.ColumnName;
  var value_ = request.body.ColumnValue;

  var date = new Date();
  date.setHours(date.getHours() + 0);

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

  var myTeamMembersControllerObjectPromise = TeamMembersController.individual_users_update(
    column_name,
    value_,
    jsonObject_
  );

  myTeamMembersControllerObjectPromise.then(
    function(result) {
      var response_object = { results: result };
      response.send(response_object);
    },
    function(err) {
      response.send("An error occurred");
      console.log(err);
    }
  );
});

router.post("/delete_individual_team_members", urlencodedParser, function(
  request,
  response
) {
  var column_name = request.body.column_name;
  //var mValue=parseInt(request.body.search_value, 10);
  var value_ = request.body.search_value;

  var myTeamMembersControllerObjectPromise = TeamMembersController.delete_users_record(
    column_name,
    value_
  );

  myTeamMembersControllerObjectPromise.then(
    function(result) {
      var response_object = { results: result };
      response.send(response_object);
    },
    function(err) {
      response.send("An error occurred");
      console.log(err);
    }
  );
});

router.post(
  "/get_team_members_with_a_specific_quality",
  urlencodedParser,
  function(request, response) {
    var TableTwo = request.body.TableTwo;

    var JoiningKey = request.body.JoiningKey;

    var SearchColumn = request.body.SearchColumn;

    var SearchValue = request.body.SearchValue;

    var myTeamMembersControllerObjectPromise = TeamMembersController.get_staff_members_with_a_specific_quality(
      TableTwo,
      JoiningKey,
      SearchColumn,
      SearchValue
    );

    myTeamMembersControllerObjectPromise.then(
      function(result) {
        var response_object = { results: result };
        response.send(response_object);
      },
      function(err) {
        response.send("An error occurred");
        console.log(err);
      }
    );
  }
);

router.post('/get_team_members_by_full_description',urlencodedParser,function(request,response){



  var myPromise = TeamMembersController.getAllTeamMembersByFullDescription();


  myPromise.then(function(result) {

    var response_object={results:result}
    response.send(response_object);
  }, function(err) {
    response.send("An error occurred");
    console.log(err);
  })

});



module.exports = router;