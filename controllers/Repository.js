/*SON/2018-11-06 00:29 - DEVELOPMENT

This class carries all of the system's CRUD operations.
All create,read,update and delete operations go through
this class.The methods have been tested and proven to 
be working.Create an instance of the class and call any
of its methods

*/

var mysql = require("mysql");
var express = require("express");
var app = express();
var path = require("path");
var con = require("../common/dbConnect.js");

module.exports = class Repository {
  /*SON/2018-11-06 00:29 - DEVELOPMENT
	
The class constructor.Does not take any arguments

*/
  constructor() {}

  /*SON/2018-11-06 00:29 - DEVELOPMENT
The insert function is for insertion of all tables
regardless of their number of columns.Pass it the
table name and a key-value pair of data to insert
with the key being the actual column name on the
database.
	
*/

  static insert(tableName, jsonObject_) {
    return new Promise(function(resolve, reject) {
      con.query("INSERT INTO " + tableName + " SET ?", jsonObject_, function(
        err,
        result
      ) {
        if (err) {
          reject(err);
        } else {
          var returned_value_ = {
            success: true,
            message: "Record inserted succesfully.",
            recordId: result.insertId
          };
          resolve(returned_value_);
        }
      });
    });
  }

  /*SON/2018-11-06 00:29 - DEVELOPMENT
	
The selectAll() is to select all data on the
table.Pass it the table name and a callback
function to retrieve back your result

*/
  static selectAll(tableName) {
    return new Promise(function(resolve, reject) {
      con.query("SELECT * FROM " + tableName + ";", function(
        err,
        result,
        fields
      ) {
        if (err) {
          reject(err);
        } else {
          var returned_value_ = result;
          resolve(returned_value_);
        }
      });
    });
  }


  static individual_update(tableName, jsonObject_, ColumnName, value_) {
    return new Promise(function(resolve, reject) {
      var selectSpecificPromise = Repository.selectSpecific(
        tableName,
        ColumnName,
        value_
      );

      selectSpecificPromise.then(
        function(result) {
          var returned_value_ = result;

          if (returned_value_.length === 0) {
            returned_value_ = "No such record exists";
            resolve(returned_value_);
          } else {
            con.query(
              "UPDATE " +
              tableName +
              " SET ? WHERE " +
              ColumnName +
              " = " +
              mysql.escape(value_),
              jsonObject_,
              function(err, result) {
                if (err) {
                  reject(err);
                }

                var returned_value_ = {
                  success: true,
                  message: "Record updated succesfully."
                };
                resolve(returned_value_);
              }
            );
          }
        },
        function(err) {
          console.log(err);
        }
      );
    });
  }

  /*SON/2018-11-06 00:29 - DEVELOPMENT

individual_update() updates a specific record(s).

*/

//get specific records


  /*SON/2018-11-06 00:29 - DEVELOPMENT
	
The selectSpecific() is to select specific a
record(s) on the table depending on the 
arguments you pass to it.Pass it the table 
name and a callback function to retrieve back
your result

*/
  static selectSpecific(tableName, ColumnName, value_) {
    return new Promise(function(resolve, reject) {
      var sql =
        "SELECT * FROM " +
        tableName +
        " WHERE " +
        ColumnName +
        " = " +
        mysql.escape(value_);
      con.query(sql, function(err, result) {
        if (err) {
          reject(err);
        } else {
          var returned_value_ = result;
          resolve(returned_value_);
        }
      });
    });
  }

  static async promiselessSelectSpecific(tableName, ColumnName, value_) {
    var sql =
      "SELECT * FROM " +
      tableName +
      " WHERE " +
      ColumnName +
      " = " +
      mysql.escape(value_);
    con.query(sql, function(err, result) {
      if (err) {
        return err;
      } else {
        var returned_value_ = result;
        return returned_value_;
      }
    });
  }

  /*SON/2018-11-06 00:29 - DEVELOPMENT
	
The selectSpecific() is to select specific a
record(s) on the table depending on the 
arguments you pass to it.Pass it the table 
name and a callback function to retrieve back
your result

*/


  /*SON/2018-11-06 00:29 - DEVELOPMENT
	
The selectSpecific() is to select specific a
record(s) on the table depending on the 
arguments you pass to it.Pass it the table 
name and a callback function to retrieve back
your result

*/


  /*SON/2018-11-06 00:29 - DEVELOPMENT
	
The selectSpecific() is to select specific a
record(s) on the table depending on the 
arguments you pass to it.Pass it the table 
name and a callback function to retrieve back
your result

*/

  /*SON/2018-11-06 00:29 - DEVELOPMENT
	
The batch_update() makes a similar update on all
records of the table you pass to it.Pass it the 
table name and the key-value pair of the updates
to make.

*/

  static batch_update(tableName, jsonObject_) {
    return new Promise(function(resolve, reject) {
      con.query("UPDATE " + tableName + " SET ?", jsonObject_, function(
        err,
        result
      ) {
        if (err) {
          reject(err);
        } else {
          var returned_value_ = {
            success: true,
            message: "Record updated succesfully.",
            recordId: result.insertId
          };
          resolve(returned_value_);
        }
      });
    });
  }

  /*SON/2018-11-06 00:29 - DEVELOPMENT
	
individual_update() updates a specific record(s).

*/




  /*SON/2018-11-06 00:29 - DEVELOPMENT
	
individual_update() updates a specific record(s).

*/


  /*SON/2018-11-06 00:29 - DEVELOPMENT
	
individual_update() updates a specific record(s).

*/


  /*SON/2018-11-06 00:29 - DEVELOPMENT
	
delete() deletes a specific record(s).

*/

  static delete(tableName, ColumnName, value_, UserIdColumnName, UserId) {
    return new Promise(function(resolve, reject) {
      var selectSpecificPromise = ModelMaster.selectUserSpecific(
        tableName,
        ColumnName,
        value_,
        UserIdColumnName,
        UserId
      );

      selectSpecificPromise.then(
        function(result) {
          var returned_value_ = result;

          if (returned_value_.length === 0) {
            returned_value_ = "No such record exists";
            resolve(returned_value_);
          } else {
            con.query(
              "DELETE FROM " +
                tableName +
                " WHERE " +
                ColumnName +
                " = " +
                mysql.escape(value_) +
                " AND " +
                UserIdColumnName +
                " = " +
                mysql.escape(UserId),
              function(err, result) {
                if (err) {
                  reject(err);
                }

                var returned_value_ = "Record Succesfully Deleted";
                resolve(returned_value_);
              }
            );
          }
        },
        function(err) {
          console.log(err);
        }
      );
    });
  }

  static getAllUserPrivilegesByFullDescription() {
    return new Promise(function(resolve, reject) {
      con.query("SELECT * FROM user_access_privileges INNER JOIN access_privileges ON access_privileges.AccessPrivilegeId = user_access_privileges.AccessPrivilegeId INNER JOIN users ON users.UserId=user_access_privileges.UserId;", function(
        err,
        result,
        fields
      ) {
        if (err) {
          reject(err);
        } else {
          var returned_value_ = result;
          resolve(returned_value_);
        }
      });
    });
  }

  static getAllAdminPrivilegesByFullDescription() {
    return new Promise(function(resolve, reject) {
      con.query("SELECT * FROM admin_user_access_privileges INNER JOIN system_admin_access_privileges ON system_admin_access_privileges.AdminAccessPrivilegeId = admin_user_access_privileges.AdminAccessPrivilegeId INNER JOIN system_admin ON system_admin.AdminId = admin_user_access_privileges.AdminId;", function(
        err,
        result,
        fields
      ) {
        if (err) {
          reject(err);
        } else {
          var returned_value_ = result;
          resolve(returned_value_);
        }
      });
    });
  }

  static getAllAdministratorPrivilegesByFullDescription() {
    return new Promise(function(resolve, reject) {
      con.query("SELECT * FROM administrator_user_access_privileges INNER JOIN administrator_access_privileges ON administrator_access_privileges.AdministratorAccessPrivilegeId = administrator_user_access_privileges.AdministratorAccessPrivilegeId INNER JOIN administrator ON administrator.AdministratorId = administrator_user_access_privileges.AdministratorId;", function(
        err,
        result,
        fields
      ) {
        if (err) {
          reject(err);
        } else {
          var returned_value_ = result;
          resolve(returned_value_);
        }
      });
    });
  }

  static getAllCompanyStatusByFullDescription() {
    return new Promise(function(resolve, reject) {
      con.query("SELECT * FROM company_user INNER JOIN company ON company.CompanyId = company_user.CompanyId INNER JOIN users ON users.UserId = company_user.UserId;", function(
        err,
        result,
        fields
      ) {
        if (err) {
          reject(err);
        } else {
          var returned_value_ = result;
          resolve(returned_value_);
        }
      });
    });
  }


  static getAllBanchProjectStatusByFullDescription() {
    return new Promise(function(resolve, reject) {
      con.query("SELECT *\n" +
        "       FROM branch_projects \n" +
        "      INNER JOIN projects ON projects.ProjectId = branch_projects.ProjectId \n" +
        "      INNER JOIN branches ON branches.BranchId = branch_projects.BranchId ;", function(
        err,
        result,
        fields
      ) {
        if (err) {
          reject(err);
        } else {
          var returned_value_ = result;
          resolve(returned_value_);
        }
      });
    });
  }

 // project branch details
//   static projectBranchDetails() {
//     return new Promise(function(resolve, reject) {
//       con.query("SELECT * FROM projects INNER JOIN branches ON branches.BranchId = projects.BranchId GROUP BY projects.ProjectTitle;", function(
//       err,
//         result,
//         fields
//     ) {
//         if (err) {
//           reject(err);
//         } else {
//           var returned_value_ = result;
//           resolve(returned_value_);
//         }
//       });
//   });
// }

};
