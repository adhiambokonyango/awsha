/*SON/2018-11-06 00:29 - DEVELOPMENT
This class is the term_iterations's controller class.
It receives calls from the "ObjectivesRoutes" class and
passes the calls down to the "ObjectivesModel" class
*/



const ObjectivesModel = require('../../models/menu/ObjectivesModel.js');
const Repository = require('../Repository');
const tableName="objectives";
const ProjectsController= require('../menu/ProjectsController')


module.exports = class ObjectivesController{
  constructor(){

  }



  static insert(jsonObject_){
    return new Promise(function(resolve, reject) {

      var myPromise = ObjectivesModel.insert(jsonObject_);


      myPromise.then(function(result) {

        resolve(result);
      }, function(err) {
        reject(err);
      })

    })
  }





  static get_all_records(){
    return new Promise(function(resolve, reject) {

      var myPromise = ObjectivesModel.get_all_records();


      myPromise.then(function(result) {
          resolve(result)
      }, function(err) {
        reject(err);
      })

    })
  }


  static async getAllProjectsAndObjectivesByFullDescription(batchObject){
    let response = await Repository.getAllProjectsAndObjectivesByFullDescription(tableName,batchObject);
    return response;
  }


  static get_specific_records(ColumnName,value_){
    return new Promise(function(resolve, reject) {

      var myPromise = ObjectivesModel.get_specific_records(ColumnName,value_);


      myPromise.then(function(result) {

        resolve(result);
      }, function(err) {
        reject(err);
      })
    })
  }




  static batch_update(jsonObject_){
    return new Promise(function(resolve, reject) {


      var myPromise = ObjectivesModel.batch_update(jsonObject_);


      myPromise.then(function(result) {

        resolve(result);
      }, function(err) {
        reject(err);
      })

    })
  }





  static individual_record_update(ColumnName,value_,jsonObject_){
    return new Promise(function(resolve, reject) {


      var myPromise = ObjectivesModel.individual_record_update(ColumnName,value_,jsonObject_, tableName);


      myPromise.then(function(result) {

        resolve(result);
      }, function(err) {
        reject(err);
      })

    })
  }





  static delete_user_specic_record(ColumnName,value_,UserIdColumnName,UserId){
    return new Promise(function(resolve, reject) {


      var myPromise = ObjectivesModel.delete_user_specic_record(ColumnName,value_,UserIdColumnName,UserId);


      myPromise.then(function(result) {

        resolve(result);
      }, function(err) {
        reject(err);
      })

    })
  }



  static get_number_of_records(ColumnName,value_){
    return new Promise(function(resolve, reject) {


      var myPromise = ObjectivesModel.get_number_of_records(ColumnName,value_);


      myPromise.then(function(result) {

        resolve(result);
      }, function(err) {
        reject(err);
      })

    })
  }






  static project_specific_select_query(value_){
    return new Promise(function(resolve, reject) {

      var myPromise = ObjectivesModel.project_specific_select_query(value_);


      myPromise.then(function(result) {

        resolve(result);
      }, function(err) {
        reject(err);
      })

    })
  }


}