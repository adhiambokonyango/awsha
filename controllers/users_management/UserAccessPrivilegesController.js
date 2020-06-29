/*SON/2018-11-06 00:29 - DEVELOPMENT
This class is the UserAccessPrivileges's controller class.
It receives calls from the "UserAccessPrivilegesRoutes" class and
passes the calls down to the "UserAccessPrivilegesModel" class
*/

const UserAccessPrivilegesModel = require("../../models/users_management/UserAccessPrivilegesModel.js");

module.exports = class UserAccessPrivilegesController {
  constructor() {}

  static insert(jsonObject_) {
    return new Promise(function(resolve, reject) {
      var myPromise = UserAccessPrivilegesModel.insert(jsonObject_);

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
      var myPromise = UserAccessPrivilegesModel.get_all_records();

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
      var myPromise = UserAccessPrivilegesModel.get_specific_records(
        ColumnName,
        value_
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

  static batch_update(jsonObject_) {
    return new Promise(function(resolve, reject) {
      var myPromise = UserAccessPrivilegesModel.batch_update(jsonObject_);

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
      var myPromise = UserAccessPrivilegesModel.individual_record_update(
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
      var myPromise = UserAccessPrivilegesModel.delete_user_specic_record(
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
      var myPromise = UserAccessPrivilegesModel.get_number_of_records(
        ColumnName,
        value_
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

  static user_specific_select_query(
    ColumnName,
    value_,
    UserIdColumnName,
    UserId
  ) {
    return new Promise(function(resolve, reject) {
      var myPromise = UserAccessPrivilegesModel.user_specific_select_query(
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

  static getAUserAccessPrivileges(userRoleId) {
    return new Promise(function(resolve, reject) {
      var myPromise = UserAccessPrivilegesModel.getAUserAccessPrivileges(
        userRoleId
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
};
