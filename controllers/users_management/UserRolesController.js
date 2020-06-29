/*SON/2018-11-06 00:29 - DEVELOPMENT
This class is the user_roles's controller class.
It receives calls from the "UserRolesRoutes" class and
passes the calls down to the "UserRolesModel" class
*/

const UserRolesModel = require("../../models/users_management/UserRolesModel.js");

module.exports = class UserRolesController {
  constructor() {}

  static insert(jsonObject_) {
    return new Promise(function(resolve, reject) {
      var myPromise = UserRolesModel.insert(jsonObject_);

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

  static get_all_records() {
    return new Promise(function(resolve, reject) {
      var myPromise = UserRolesModel.get_all_records();

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

  static get_specific_records(ColumnName, value_) {
    return new Promise(function(resolve, reject) {
      var myPromise = UserRolesModel.get_specific_records(ColumnName, value_);

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

  static batch_update(jsonObject_) {
    return new Promise(function(resolve, reject) {
      var myPromise = UserRolesModel.batch_update(jsonObject_);

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

  static individual_record_update(ColumnName, value_, jsonObject_) {
    return new Promise(function(resolve, reject) {
      var myPromise = UserRolesModel.individual_record_update(
        ColumnName,
        value_,
        jsonObject_
      );

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

  static delete_user_specic_record(
    ColumnName,
    value_,
    UserIdColumnName,
    UserId
  ) {
    return new Promise(function(resolve, reject) {
      var myPromise = UserRolesModel.delete_user_specic_record(
        ColumnName,
        value_,
        UserIdColumnName,
        UserId
      );

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

  static get_number_of_records(ColumnName, value_) {
    return new Promise(function(resolve, reject) {
      var myPromise = UserRolesModel.get_number_of_records(ColumnName, value_);

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

  static user_specific_select_query(
    ColumnName,
    value_,
    UserIdColumnName,
    UserId
  ) {
    return new Promise(function(resolve, reject) {
      var myPromise = UserRolesModel.user_specific_select_query(
        ColumnName,
        value_,
        UserIdColumnName,
        UserId
      );

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

  static getAUserRoles(userId) {
    return new Promise(function(resolve, reject) {
      var myPromise = UserRolesModel.getAUserRoles(userId);

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


  static checkWhetherAUserHasACertainRole(userId,roleCode) {
    return new Promise(function(resolve, reject) {
      var myPromise = UserRolesModel.checkWhetherAUserHasACertainRole(userId,roleCode);

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

  static checkUserAllowedLoginWithCertainRole(userRoleId) {
    return new Promise(function(resolve, reject) {
      var myPromise = UserRolesModel.checkUserAllowedLoginWithCertainRole(userRoleId);

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
};
