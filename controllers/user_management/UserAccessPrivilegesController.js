const Repository=require('../Repository');
const tableName="user_access_privileges";

const ModelMaster = require("../../models/ModelMaster");

module.exports = class UserAccessPrivilegesController{




    static async insert(recordObject){
        let response = await Repository.insert(tableName,recordObject);
        return response;
    }

    static get_specific_records(ColumnName, value_) {
        var TableName = "user_access_privileges";
        var ColumnName = "UserAccessPrivilegeId";
        return new Promise(function(resolve, reject) {
            var myPromise = ModelMaster.selectSpecific(TableName, ColumnName, value_);
            myPromise.then(
              function(result) {
                  resolve(result);
              },
              function(err) {
                  reject(err);
              }
            );
        });
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

    static getPrivilegesForParticularUserForParticularRole(userId,roleCode,accessPrivilegeCode) {

        return new Promise(function(resolve, reject) {
            var myPromise = ModelMaster.getPrivilegesForParticularUserForParticularRole(userId,roleCode,accessPrivilegeCode);
            myPromise.then(
              function(result) {
                  resolve(result);
              },
              function(err) {
                  reject(err);
              }
            );
        });
    }

}
