/*SON/2018-11-06 00:29 - DEVELOPMENT
This class is the AdminSession_logs table's route class.
It is initialized at the "Index.js" and is able to recieve
calls from the client and passes the calls down to the
"AdministratorSessionLogsController" class
*/

const express = require("express");
const router = express.Router();
const bodyParser = require("body-parser");
var urlencodedParser = bodyParser.urlencoded({ extended: false });
const AdministratorSessionLogsController = require("../../controllers/session_management/AdministratorSessionLogsController.js");

//Middle ware that is specific to this router
router.use(function timeLog(req, res, next) {
  next();
});

router.post("/add_administrator_session_logs", urlencodedParser, function(request, response) {
  var date = new Date();
  // date.setHours(date.getHours()+0);
  date.setTime(date.getTime());


  var jsonObject_ = {
    AdministratorId: request.body.AdministratorId,
    AdministratorSessionStartDate: date,
    AdministratorSessionEndDate: date,
  };

  var myPromise = AdministratorSessionLogsController.insert(jsonObject_);

  myPromise.then(
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

router.post("/get_all_administrator_session_logs", urlencodedParser, function(
  request,
  response
) {
  var myPromise = AdministratorSessionLogsController.selectAll();

  myPromise.then(
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

router.post("/get_specific_administrator_session_logs", urlencodedParser, function(
  request,
  response
) {
  var mKey = request.body.column_name;
  //var mValue=parseInt(request.query.search_value, 10);
  var mValue = request.body.search_value;

  var myPromise = AdministratorSessionLogsController.selectSpecific(mKey, mValue);

  myPromise.then(
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

router.post("/update_administrator_session_logs", urlencodedParser, function(
  request,
  response
) {
  var date = new Date();
  date.setTime(date.getTime());
  var jsonObject_ = {
    AdministratorId: request.body.AdministratorId,
    AdministratorSessionStartDate: date,
    AdministratorSessionEndDate: date,
  };

  var myPromise = AdministratorSessionLogsController.batchUpdate(jsonObject_);

  myPromise.then(
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

router.post("/update_individual_administrator_session_logs", urlencodedParser, function(
  request,
  response
) {
  var date = new Date();
  date.setTime(date.getTime());
  var column_name = request.body.ColumnName;
  var value_ = request.body.ColumnValue;

  var jsonObject_ = {
    AdminSessionEndDate: date
  };

  var myPromise = AdministratorSessionLogsController.individual_record_update(
    column_name,
    value_,
    jsonObject_
  );

  myPromise.then(
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

router.post("/delete_individual_administrator_session_logs", urlencodedParser, function(
  request,
  response
) {
  var column_name = request.body.column_name;
  //var mValue=parseInt(request.body.search_value, 10);
  var value_ = request.body.search_value;

  var UserIdColumnName = request.body.UserIdColumnName;

  var UserId = request.body.AdministratorId;

  var myPromise = AdministratorSessionLogsController.delete_user_specic_record(
    column_name,
    value_,
    UserIdColumnName,
    UserId
  );

  myPromise.then(
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

router.post("/get_number_of_administrator_session_logs_records", urlencodedParser, function(
  request,
  response
) {
  var column_name = request.body.column_name;
  //var mValue=parseInt(request.body.search_value, 10);
  var value_ = request.body.search_value;

  var myPromise = AdministratorSessionLogsController.get_number_of_records(
    column_name,
    value_
  );

  myPromise.then(
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

router.post("/administrator_session_logs_user_specific_query", urlencodedParser, function(
  request,
  response
) {
  var ColumnName = request.body.ColumnName;
  //var mValue=parseInt(request.body.search_value, 10);
  var value_ = request.body.value_;

  var UserIdColumnName = request.body.UserIdColumnName;

  var UserId = request.body.AdministratorId;

  var myPromise = AdministratorSessionLogsController.user_specific_select_query(
    ColumnName,
    value_,
    UserIdColumnName,
    UserId
  );

  myPromise.then(
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


router.post("/get_user_by_administrator_session_log", urlencodedParser, function(
  request,
  response
) {
  var AdminSessionLogId = request.body.AdminSessionLogId;

  var myPromise = AdministratorSessionLogsController.getUserByAdminSessionLogId(AdminSessionLogId);

  myPromise.then(
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

module.exports = router;