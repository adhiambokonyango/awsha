/*SON/2018-11-06 00:29 - DEVELOPMENT
This class is the term_iterations's controller class.
It receives calls from the "ProjectsRoutes" class and
passes the calls down to the "ProjectsModel" class
*/



const ProjectsModel = require('../../models/menu/ProjectsModel.js');
const Repository=require('../Repository')
const tableName="projects";
const BranchController=require('./BranchController');
const BranchProjectsController=require('./BranchProjectsController');



module.exports = class ProjectsController{
  constructor(){

  }



// record project where title is unique to a project
  static async insert(recordObject){
    let userValidationColumn = "ProjectTitle";
    let responseObject = {};

    let projectRequestArray = await ProjectsController.get_specific_records(userValidationColumn,recordObject.ProjectTitle);

    if(projectRequestArray.length === 0) {

      let insertResponse = await Repository.insert(tableName,recordObject);

      ProjectsController.assignAProjectBranch(insertResponse.recordId);

      responseObject = {
        registrationSuccess: true,
        registrationErrorMessage: "project registration successful" ,
        projectDetails: insertResponse,

      }


    } else {
      responseObject = {registrationSuccess: false, registrationErrorMessage: "A project already exists by this title"}

    }

    return responseObject;
  }


// UI project selection
  static projectSelect(jsonObject_) {
    return new Promise(function(resolve, reject) {

      var TableName = "projects";
      var SearchColumn = "ProjectTitle";
      var SearchValue = jsonObject_.AttemptedProjectTitle;

      var myModelMasterPromise = Repository.selectSpecific(
        TableName,
        SearchColumn,
        SearchValue
      );

      myModelMasterPromise.then(
        function(titleExistsResult) {
          if (titleExistsResult.length < 0) {
            var error_msg = "There is no project by this title";
            var response_object = { error: true, error_msg: error_msg };
            resolve(response_object);
          } else {
            var projectTitle = titleExistsResult[0].ProjectTitle;
            if (
              projectTitle ===
              titleExistsResult[0].ProjectTitle
            ) {
              var response_object = {
                error: false,
                ProjectId: titleExistsResult[0].ProjectId,
                ProjectTitle: titleExistsResult[0].ProjectTitle

              };

            } else {
              var error_msg = "Selection failed";
              var response_object = { error: true, error_msg: error_msg };
            }
            resolve(response_object);
            //loginResponse.push(response_object);
          }

        },


        function(err) {
          reject(err);
        }
      );
    });
  }


// regular insert
  static recordProject(jsonObject_){
    return new Promise(function(resolve, reject) {

      var myPromise = ProjectsModel.insert(jsonObject_);


      myPromise.then(function(result) {

        resolve(result);
      }, function(err) {
        reject(err);
      })

    })
  }





  static get_all_records(){
    return new Promise(function(resolve, reject) {

      var myPromise = ProjectsModel.get_all_records();


      myPromise.then(function(result) {

        resolve(result);
      }, function(err) {
        reject(err);
      })

    })
  }





  static get_specific_records(ColumnName,value_){
    return new Promise(function(resolve, reject) {

      var myPromise = ProjectsModel.get_specific_records(ColumnName,value_, tableName);


      myPromise.then(function(result) {

        resolve(result);
      }, function(err) {
        reject(err);
      })
    })
  }




  static batch_update(jsonObject_){
    return new Promise(function(resolve, reject) {


      var myPromise = ProjectsModel.batch_update(jsonObject_);


      myPromise.then(function(result) {

        resolve(result);
      }, function(err) {
        reject(err);
      })

    })
  }





  static individual_record_update(ColumnName,value_,jsonObject_){
    return new Promise(function(resolve, reject) {


      var myPromise = ProjectsModel.individual_record_update(ColumnName,value_,jsonObject_, tableName);


      myPromise.then(function(result) {

        resolve(result);
      }, function(err) {
        reject(err);
      })

    })
  }





  static delete_user_specic_record(ColumnName,value_,UserIdColumnName,UserId){
    return new Promise(function(resolve, reject) {


      var myPromise = ProjectsModel.delete_user_specic_record(ColumnName,value_,UserIdColumnName,UserId);


      myPromise.then(function(result) {

        resolve(result);
      }, function(err) {
        reject(err);
      })

    })
  }



  static get_number_of_records(ColumnName,value_){
    return new Promise(function(resolve, reject) {


      var myPromise = ProjectsModel.get_number_of_records(ColumnName,value_);


      myPromise.then(function(result) {

        resolve(result);
      }, function(err) {
        reject(err);
      })

    })
  }

  static user_specific_select_query(ColumnName,value_,UserIdColumnName,UserId){
    return new Promise(function(resolve, reject) {


      var myPromise = ProjectsModel.user_specific_select_query(ColumnName,value_,UserIdColumnName,UserId);


      myPromise.then(function(result) {

        resolve(result);
      }, function(err) {
        reject(err);
      })

    })
  }


  static async assignAProjectBranch(projectId) {
    let branchesArray = await BranchController.selectAll();

    for (let i = 0;i<branchesArray.length;i++) {
      const payload = {
        ProjectId: projectId,
        BranchId: branchesArray[i].BranchId,
        BranchProjectStatus: 0
      };

      await BranchProjectsController.insert(payload);
    }
  }
}
