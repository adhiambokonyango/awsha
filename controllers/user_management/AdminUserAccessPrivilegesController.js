const Repository=require('../Repository');
const tableName="admin_user_access_privileges";

const ModelMaster = require("../../models/ModelMaster");

module.exports = class AdminUserAccessPrivilegesController{




  static async insert(recordObject){
    let response = await Repository.insert(tableName,recordObject);
    return response;
  }



  static async selectAll(){
    let response = await Repository.selectAll(tableName);
    return response;
  }

  static async getAllAdminPrivilegesByFullDescription(){
    let response = await Repository.getAllAdminPrivilegesByFullDescription(tableName);
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


}
