/*SON/2018-11-06 00:29 - DEVELOPMENT
This class is the AccessPrivileges's controller class.
It receives calls from the "AccessPrivilegesRoutes" class and
passes the calls down to the "AccessPrivilegesModel" class
*/

const AccessPrivilegesModel = require("../../models/users_management/AccessPrivilegesModel.js");

module.exports = class AccessPrivilegesController {
  constructor() {}

  static insert(jsonObject_) {
    return new Promise(function(resolve, reject) {
      var myPromise = AccessPrivilegesModel.insert(jsonObject_);

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
      var myPromise = AccessPrivilegesModel.get_all_records();

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
      var myPromise = AccessPrivilegesModel.get_specific_records(
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
      var myPromise = AccessPrivilegesModel.batch_update(jsonObject_);

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
      var myPromise = AccessPrivilegesModel.individual_record_update(
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
      var myPromise = AccessPrivilegesModel.delete_user_specic_record(
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
      var myPromise = AccessPrivilegesModel.get_number_of_records(
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
      var myPromise = AccessPrivilegesModel.user_specific_select_query(
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
};
