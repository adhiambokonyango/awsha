/*SON/2018-11-06 00:29 - DEVELOPMENT
This class is the term_iterations's controller class.
It receives calls from the "CompanyRoutes" class and
passes the calls down to the "BranchActivationModel" class
*/



const BranchActivationModel = require('../../models/menu/BranchActivationModel.js');

const Repository=require('../Repository');
const tableName = "company_user";


module.exports = class BranchActivationController{
  constructor(){

  }

  static async individualUpdate(columnName,columnValue,recordObject){
    let response = await Repository.individual_update(tableName,recordObject,columnName,columnValue);
    return response;
  }

  static insert(jsonObject_){
    return new Promise(function(resolve, reject) {

      var myPromise = BranchActivationModel.insert(jsonObject_);


      myPromise.then(function(result) {

        resolve(result);
      }, function(err) {
        reject(err);
      })

    })
  }



  static async getAllCompanyStatusByFullDescription(){
    let response = await Repository.getAllCompanyStatusByFullDescription(tableName);
    return response;
  }


  static get_all_records(){
    return new Promise(function(resolve, reject) {

      var myPromise = BranchActivationModel.get_all_records();


      myPromise.then(function(result) {

        resolve(result);
      }, function(err) {
        reject(err);
      })

    })
  }





  static get_specific_records(ColumnName,value_){
    return new Promise(function(resolve, reject) {

      var myPromise = BranchActivationModel.get_specific_records(ColumnName,value_);


      myPromise.then(function(result) {

        resolve(result);
      }, function(err) {
        reject(err);
      })
    })
  }




  static batch_update(jsonObject_){
    return new Promise(function(resolve, reject) {


      var myPromise = BranchActivationModel.batch_update(jsonObject_);


      myPromise.then(function(result) {

        resolve(result);
      }, function(err) {
        reject(err);
      })

    })
  }





  static individual_record_update(ColumnName,value_,jsonObject_){
    return new Promise(function(resolve, reject) {


      var myPromise = BranchActivationModel.individual_record_update(ColumnName,value_,jsonObject_);


      myPromise.then(function(result) {

        resolve(result);
      }, function(err) {
        reject(err);
      })

    })
  }





  static delete_user_specic_record(ColumnName,value_,UserIdColumnName,UserId){
    return new Promise(function(resolve, reject) {


      var myPromise = BranchActivationModel.delete_user_specic_record(ColumnName,value_,UserIdColumnName,UserId);


      myPromise.then(function(result) {

        resolve(result);
      }, function(err) {
        reject(err);
      })

    })
  }



  static get_number_of_records(ColumnName,value_){
    return new Promise(function(resolve, reject) {


      var myPromise = BranchActivationModel.get_number_of_records(ColumnName,value_);


      myPromise.then(function(result) {

        resolve(result);
      }, function(err) {
        reject(err);
      })

    })
  }






  static user_specific_select_query(ColumnName,value_,UserIdColumnName,UserId){
    return new Promise(function(resolve, reject) {


      var myPromise = BranchActivationModel.user_specific_select_query(ColumnName,value_,UserIdColumnName,UserId);


      myPromise.then(function(result) {

        resolve(result);
      }, function(err) {
        reject(err);
      })

    })
  }




}