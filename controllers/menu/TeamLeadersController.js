const Repository=require('../Repository');
const tableName="team_leaders";
const ModelMaster=require('../../models/ModelMaster');

module.exports = class TeamLeadersController{

  static async insert(recordObject){
    let response = await Repository.insert(tableName,recordObject);
    return response;
  }


  static async selectAll(){
    let response = await Repository.selectAll(tableName);
    return response;
  }


  static async selectSpecific(columnName,columnValue){
    let response = await Repository.selectSpecific(tableName,columnName,columnValue);
    return response;
  }


  static async batchUpdate(batchObject){
    let response = await Repository.batch_update(tableName,batchObject);
    return response;
  }


  static async individualUpdate(columnName,columnValue,recordObject){
    let response = await Repository.individual_update(tableName,recordObject,columnName,columnValue);
    return response;
  }

  static project_specific_select_query_for_team_lead(value_){
    return new Promise(function(resolve, reject) {

      var myPromise = ModelMaster.project_specific_select_query_for_team_lead(value_);


      myPromise.then(function(result) {

        resolve(result);
      }, function(err) {
        reject(err);
      })

    })
  }
}
