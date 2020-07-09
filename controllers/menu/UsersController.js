const ModelMaster = require("../../models/ModelMaster.js");
const UsersModel = require("../../models/menu/UsersModel");
const crypto = require("crypto");
var pbkdf2 = require("pbkdf2");

module.exports = class UsersController {
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
      var TableName = "users";
      var ColumnName = "Email";
      var value_ = jsonObject_.Email;
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

            var myUsersObjectPromise = UsersModel.insert(
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
      var TableName = "users";
      var SearchColumn = "Email";
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
                UserId: userExistsResult[0].UserId,
                FirstName: userExistsResult[0].FirstName,
                MiddleName: userExistsResult[0].MiddleName,
                Surname: userExistsResult[0].Surname,
                PhoneNumber: userExistsResult[0].PhoneNumber,
                Email: userExistsResult[0].Email,
                GenderId: userExistsResult[0].GenderId,
                NationalId: userExistsResult[0].NationalId,
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
      var myUsersObjectPromise = UsersModel.get_all_records();

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
      var myUsersObjectPromise = UsersModel.get_specific_records(
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
      var myUsersObjectPromise = UsersModel.batch_update(
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
      var myUsersObjectPromise = UsersModel.individual_record_update(
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
      var myUsersObjectPromise = UsersModel.delete_user_specic_record(
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

};