const crypto = require("crypto");
var pbkdf2 = require("pbkdf2");
const Repository=require('../Repository');
const tableName="office_admin";
const RolesController=require('./RolesController');
const UserRolesController=require('./UserRolesController');
const AccessPrivilegesController=require('./AccessPrivilegesController');
const UserAccessPrivilegesController=require('./UserAccessPrivilegesController');
const ModelMaster = require("../../models/ModelMaster");

module.exports = class OfficeAdminController{

  static async insert(recordObject){
    let userValidationColumn = "Email";
    let responseObject = {};

    let userRequestArray = await OfficeAdminController.selectSpecific(userValidationColumn,recordObject.Email);

    if(userRequestArray.length === 0) {
      let salt = crypto.randomBytes(128).toString("base64");
      let hash = crypto.createHmac(
        "sha512",
        salt
      ); /** Hashing algorithm sha512 */

      hash.update(recordObject.EncryptedPassword);
      let encrypted_Password = hash.digest("hex");

      delete recordObject["EncryptedPassword"];
      recordObject["EncryptedPassword"] = encrypted_Password;
      recordObject["Salt"] = salt;

      let insertResponse = await Repository.insert(tableName,recordObject);

      OfficeAdminController.assignAUserRoles(insertResponse.recordId);
      responseObject = {registrationSuccess: true, registrationErrorMessage: "User registration successful" , userDetails: insertResponse }

    } else {
      responseObject = {registrationSuccess: false, registrationErrorMessage: "A user already exists by this email"}

    }

    return responseObject;
  }


  static login(jsonObject_) {
    return new Promise(function(resolve, reject) {
      var TableName = "users";
      var SearchColumn = "Email";
      var SearchValue = jsonObject_.AttemptedEmail;

      var myModelMasterPromise = Repository.selectSpecific(
        TableName,
        SearchColumn,
        SearchValue
      );

      myModelMasterPromise.then(
        function(userExistsResult) {
          if (userExistsResult.length === 0) {
            var error_msg = "There is no staff member by this email";
            var response_object = { error: true, error_msg: error_msg };
            resolve(response_object);
          } else {
            // var loginResponse = [];
            var hash = crypto.createHmac(
              "sha512",
              userExistsResult[0].Salt
            ); /** Hashing algorithm sha512 */
            hash.update(jsonObject_.AttemptedPassword);
            var Attempted_encrypted_Password = hash.digest("hex");

            if (
              Attempted_encrypted_Password ===
              userExistsResult[0].EncryptedPassword
            ) {
              var response_object = {
                error: false,
                OfficeAdminId: userExistsResult[0].OfficeAdminId,
                FirstName: userExistsResult[0].FirstName,
                MiddleName: userExistsResult[0].MiddleName,
                Surname: userExistsResult[0].Surname,
                PhoneNumber: userExistsResult[0].PhoneNumber,
                Email: userExistsResult[0].Email,
                GenderId: userExistsResult[0].GenderId,
                NationalId: userExistsResult[0].NationalId,

              };
            } else {
              var error_msg = "Login failed";
              var response_object = { error: true, error_msg: error_msg };
            }

            //loginResponse.push(response_object);
            resolve(response_object);
          }
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

  static async assignAUserRoles(userId) {
    let rolesArray = await RolesController.selectAll();

    for (let i = 0;i < rolesArray.length;i++) {

      const payload = {
        OfficeAdminId: userId,
        RoleId: rolesArray[i].RoleId,
        ConfirmationStatus: 0
      };
      let userRoleInsertObject = await UserRolesController.insert(payload);
      OfficeAdminController.assignAUserAccessPrivileges(userId,userRoleInsertObject.recordId);
    }

  }

  static async assignAUserAccessPrivileges(userId,userRoleId) {
    let accessPrivilegeArray = await AccessPrivilegesController.selectAll();

    for (let i = 0;i<accessPrivilegeArray.length;i++) {
      const payload = {
        OfficeAdminId: userId,
        UserRoleId: userRoleId,
        AccessPrivilegeId: accessPrivilegeArray[i].AccessPrivilegeId,
        PermisionStatus: 0
      };

      await UserAccessPrivilegesController.insert(payload);
    }
  }
}
