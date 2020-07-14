const crypto = require("crypto");
var pbkdf2 = require("pbkdf2");
const Repository=require('../Repository');
const tableName="users";
const RolesController=require('./RolesController');
const UserRolesController=require('./UserRolesController');
const AccessPrivilegesController=require('./AccessPrivilegesController');
const UserAccessPrivilegesController=require('./UserAccessPrivilegesController');

module.exports = class UsersController{

    static async insert(recordObject){
        let userValidationColumn = "Email";
        let responseObject = {};

        let userRequestArray = await UsersController.selectSpecific(userValidationColumn,recordObject.Email);

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

            UsersController.assignAUserRoles(insertResponse.recordId);
            responseObject = {registrationSuccess: true, registrationErrorMessage: "User registration successful" , userDetails: insertResponse }

        } else {
            responseObject = {registrationSuccess: false, registrationErrorMessage: "A user already exists by this email"}

        }

        return responseObject;
    }



    static async login(jsonObject_) {

        var TableName = "users";
        var SearchColumn = "Email";
        var SearchValue = jsonObject_.AttemptedEmail;

        // let roles = await RolesController.selectAll()
        // let privileges = await AccessPrivilegesController.selectAll()

        var user = Repository.promiselessSelectSpecific(
          TableName,
          SearchColumn,
          SearchValue,
          // roles,
          // privileges
        );

        console.log(user);

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
                UserId: userId,
                RoleId: rolesArray[i].RoleId,
                ConfirmationStatus: 0
            };
            let userRoleInsertObject = await UserRolesController.insert(payload);
            UsersController.assignAUserAccessPrivileges(userId,userRoleInsertObject.recordId);
        }

    }

    static async assignAUserAccessPrivileges(userId,userRoleId) {
        let accessPrivilegeArray = await AccessPrivilegesController.selectAll();

        for (let i = 0;i<accessPrivilegeArray.length;i++) {
            const payload = {
                UserId: userId,
                UserRoleId: userRoleId,
                AccessPrivilegeId: accessPrivilegeArray[i].AccessPrivilegeId,
                PermisionStatus: 0
            };

            await UserAccessPrivilegesController.insert(payload);
        }
    }
}
