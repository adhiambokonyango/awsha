const Repository=require('../Repository');
const tableName="system_admin_access_privileges";

const ModelMaster = require("../../models/ModelMaster");

module.exports = class SystemAdminAccessPrivilegesController{




    static async insert(recordObject){
        let response = await Repository.insert(tableName,recordObject);
        return response;
    }

    static get_specific_records(ColumnName, value_) {
        var TableName = "system_admin_access_privileges";
        var ColumnName = "SystemAdminAccessPrivilegeId";
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

    static getPrivilegesForParticularUserForParticularRole(systemAdminId,roleCode,accessPrivilegeCode) {

        return new Promise(function(resolve, reject) {
            var myPromise = ModelMaster.getPrivilegesForParticularUserForParticularRole(systemAdminId,roleCode,accessPrivilegeCode);
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
