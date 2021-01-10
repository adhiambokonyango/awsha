

const express = require('express');
const router = express.Router();
const bodyParser = require('body-parser');
var urlencodedParser = bodyParser.urlencoded({ extended: false });
const UsersController = require('../../controllers/user_management/UsersController');



//Middle ware that is specific to this router
router.use(function timeLog(req, res, next) {

    next();
});

router.post('/user_registration', urlencodedParser,function(request,response){

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

    };

    var myPromise = UsersController.insert(recordObject);


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

router.post("/login", urlencodedParser, function(
  request,
  response
) {
    var jsonObject_ = {
        AttemptedEmail: request.body.AttemptedEmail,
        AttemptedPassword: request.body.AttemptedPassword,
        AttemptedRoleCode: request.body.AttemptedRoleCode
    };

    var myCompanySystemUsersControllerObjectPromise = UsersController.login(
      jsonObject_
    );

    myCompanySystemUsersControllerObjectPromise.then(
      function(result) {
          response.send(result);
      },
      function(err) {
          console.log(err);
          response.send("An error occurred");
      }
    );
});

//
// function paginatedResults(result){
//     return function(req, res, next){
//         const page = req.query.page;
//         const limit = req.query.limit;
//         const startIndex = (page - 1) * limit;
//         const endIndex = page * limit;
//
//         const results = {};
//
//         if (endIndex < result.length){
//             results.next = {
//                 page: page + 1,
//                 limit: limit
//             }
//         }
//         if (startIndex > 0){
//             results.previous = {
//                 page: page - 1,
//                 limit: limit
//             }
//         }
//
//         results.results =  result.slice(startIndex, endIndex);
//         res.paginatedResults = results;
//         next();
//     }
// }



router.post("/get_all_users/:page/:limit",urlencodedParser, function(request,response, next){
    const page = request.params.page;
    const limit = request.params.limit;
    const startIndex = (page - 1) * limit;
    const endIndex = page * limit;
    const results = {};

    var myUsersControllerObjectPromise = UsersController.selectAll();

    myUsersControllerObjectPromise.then(function(result) {

        if (endIndex < result.length){
            results.next = {
                page: page + 1,
                limit: limit
            }
        }
        if (startIndex > 0){
            results.previous = {
                page: page - 1,
                limit: limit
            }
        }

        results.results =  result.slice(startIndex, endIndex);
        request.paginatedResults = results;
        response.send(results);
        console.log(results);
        next();

        // var response_object={results:result}
        // response.send(response_object);
        // console.log(response_object);
    }, function(err) {
        console.log(err);
        response.send("An error occurred");
    })
 });


router.post("/get_number_of_user_records", urlencodedParser, function(
  request,
  response
) {
    var myPromise = UsersController.getNumberOfUserRecords();

    myPromise.then(
      function(result) {
          var response_object = { results: result };
          console.log(response_object);
          response.send(response_object);
      },
      function(err) {
          console.log(err);
          response.send("An error occurred");
      }
    );
});

router.post('/update_users',urlencodedParser,function(request,response){

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


    var myUsersControllerObjectPromise = UsersController.batchUpdate(jsonObject_);


    myUsersControllerObjectPromise.then(function(result) {

        var response_object={results:result}
        response.send(response_object);
    }, function(err) {
        response.send("An error occurred");
        console.log(err);
    })

});







router.post('/get_specific_users',urlencodedParser,function(request,response){
    var mKey=request.body.column_name;
    //var mValue=parseInt(request.query.search_value, 10);
    var mValue=request.body.search_value;




    var myUsersControllerObjectPromise = UsersController.selectSpecific(mKey,mValue);


    myUsersControllerObjectPromise.then(function(result) {

        var response_object={results:result}
        response.send(response_object);
    }, function(err) {
        response.send("An error occurred");
        console.log(err);
    })


});






router.post('/update_individual_users',urlencodedParser,function(request,response){

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


    var myUsersControllerObjectPromise = UsersController.individualUpdate(column_name,value_,jsonObject_);


    myUsersControllerObjectPromise.then(function(result) {

        var response_object={results:result}
        response.send(response_object);
    }, function(err) {
        response.send("An error occurred");
        console.log(err);
    })

});

router.post('/get_users_and_privileges',urlencodedParser,function(request,response){



    var myPromise = UsersController.getAllUsersAndPrivileges();


    myPromise.then(function(result) {

        var response_object={results:result}
        response.send(response_object);
    }, function(err) {
        response.send("An error occurred");
        console.log(err);
    })

});



module.exports = router;
