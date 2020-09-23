const Repository=require('../Repository');
const tableName="branch_projects";


module.exports = class BranchProjectsController{

  static async insert(recordObject){
    let response = await Repository.insert(tableName,recordObject);
    return response;
  }


  static async getAllBanchProjectStatusByFullDescription(){
    let response = await Repository.getAllBanchProjectStatusByFullDescription(tableName);
    return response;
  }

  static async selectAll(){
    let response = await Repository.selectAll(tableName);
    return response;
  }



  static async selectSpecific(columnName,columnValue){
    columnName = "BranchProjectId";
    columnValue = "BranchProjectId";
    let response = await Repository.selectSpecific(tableName,columnName,columnValue);
    return response;
  }


  static async batchUpdate(batchObject){
    let response = await Repository.batch_update(tableName,batchObject);
    return response;
  }


  static async individualUpdate(columnName,columnValue,recordObject){
    columnName = "BranchProjectId";
    columnValue = "BranchProjectId";
    let response = await Repository.individual_update(tableName,recordObject,columnName,columnValue);
    return response;
  }
}