const ModelMaster = require("../../models/ModelMaster.js");
const TeamMembersModel = require("../../models/menu/TeamMembersModel");
const crypto = require("crypto");
var pbkdf2 = require("pbkdf2");

module.exports = class TeamMembersController {
  constructor() {}

  /*my_hash_function(password, salt){
		
          var hash = crypto.createHmac('sha512', salt); 
          hash.update(password);
          var value = hash.digest('hex');
          return {
             salt:salt,
             encrypted_Password:value
          };
    }*/

  static insert_users(jsonObject_) {
    return new Promise(function(resolve, reject) {
      //var userAlreadyRegisteredResult;
      var TableName = "team_members";
      var ColumnName = "TeamMemberEmail";
      var value_ = jsonObject_.TeamMemberEmail;
      var myModelMasterPromise = ModelMaster.selectSpecific(
        TableName,
        ColumnName,
        value_
      );

      myModelMasterPromise.then(
        function(userAlreadyRegisteredResult) {
          if (userAlreadyRegisteredResult.length === 0) {
            var salt = crypto.randomBytes(128).toString("base64");
            var hash = crypto.createHmac(
              "sha512",
              salt
            ); /** Hashing algorithm sha512 */

            hash.update(jsonObject_.EncryptedPassword);
            var encrypted_Password = hash.digest("hex");

            delete jsonObject_["EncryptedPassword"];
            jsonObject_["EncryptedPassword"] = encrypted_Password;
            jsonObject_["Salt"] = salt;

            var myUsersObjectPromise = TeamMembersModel.insert(
              jsonObject_
            );

            myUsersObjectPromise.then(
              function(result) {
                resolve(result);
              },
              function(err) {
                reject(err);
              }
            );
          } else {
            var myResponse = "A user already exists by this email";
            resolve(myResponse);
          }
        },
        function(err) {
          reject(err);
        }
      );
    });
  }

  static user_login(jsonObject_) {
    return new Promise(function(resolve, reject) {
      var TableName = "team_members";
      var SearchColumn = "TeamMemberEmail";
      var SearchValue = jsonObject_.AttemptedEmail;

      var myModelMasterPromise = ModelMaster.selectSpecific(
        TableName,
        SearchColumn,
        SearchValue
      );

      myModelMasterPromise.then(
        function(userExistsResult) {
          if (userExistsResult.length === 0) {
            var error_msg = "There is no user by this email";
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
                TeamMemberId: userExistsResult[0].TeamMemberId,
                TeamMemberName: userExistsResult[0].TeamMemberName,
                TeamMemberEmail: userExistsResult[0].TeamMemberEmail,
                TeamId: userExistsResult[0].TeamId,
                CompanyId: userExistsResult[0].CompanyId,
                GenderId: userExistsResult[0].GenderId,
                TeamMemberNationalId: userExistsResult[0].TeamMemberNationalId,
                RegisteredDate: userExistsResult[0].RegisteredDate
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

  static get_all_admin() {
    return new Promise(function(resolve, reject) {
      var myUsersObjectPromise = TeamMembersModel.get_all_records();

      myUsersObjectPromise.then(
        function(result) {
          resolve(result);
        },
        function(err) {
          reject(err);
        }
      );
    });
  }

  static get_specific_users(ColumnName, value_) {
    return new Promise(function(resolve, reject) {
      var myUsersObjectPromise = TeamMembersModel.get_specific_records(
        ColumnName,
        value_
      );

      myUsersObjectPromise.then(
        function(result) {
          resolve(result);
        },
        function(err) {
          reject(err);
        }
      );
    });
  }

  static batch_users_update(jsonObject_) {
    return new Promise(function(resolve, reject) {
      var myUsersObjectPromise = TeamMembersModel.batch_update(
        jsonObject_
      );

      myUsersObjectPromise.then(
        function(result) {
          resolve(result);
        },
        function(err) {
          reject(err);
        }
      );
    });
  }

  static individual_users_update(ColumnName, value_, jsonObject_) {
    return new Promise(function(resolve, reject) {
      var myUsersObjectPromise = TeamMembersModel.individual_record_update(
        ColumnName,
        value_,
        jsonObject_
      );

      myUsersObjectPromise.then(
        function(result) {
          resolve(result);
        },
        function(err) {
          reject(err);
        }
      );
    });
  }

  static delete_users_record(ColumnName, value_) {
    return new Promise(function(resolve, reject) {
      var myUsersObjectPromise = TeamMembersModel.delete_user_specic_record(
        ColumnName,
        value_
      );

      myUsersObjectPromise.then(
        function(result) {
          resolve(result);
        },
        function(err) {
          reject(err);
        }
      );
    });
  }

  static getAllTeamMembersByFullDescription(){
    return new Promise(function(resolve, reject) {


      var myPromise = TeamMembersModel.getAllTeamMembersByFullDescription();


      myPromise.then(function(result) {

        resolve(result);
      }, function(err) {
        reject(err);
      })

    })
  }

};