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

module.exports = class ModelMaster {
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

  static individual_update(tableName, jsonObject_, ColumnName, value_) {
    return new Promise(function(resolve, reject) {
      var selectSpecificPromise = ModelMaster.selectSpecific(
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

  /*SON/2018-11-06 00:29 - DEVELOPMENT

batch_program() is a special function that handles batch jobs.

*/



  static two_table_inner_join(
    TableOne,
    TableTwo,
    JoiningKey,
    SearchColumn,
    SearchValue
  ) {
    return new Promise(function(resolve, reject) {
      con.query(
        "SELECT * FROM " +
        TableOne +
        " INNER JOIN " +
        TableTwo +
        " ON " +
        TableOne +
        "." +
        JoiningKey +
        " = " +
        TableTwo +
        "." +
        JoiningKey +
        " WHERE " +
        TableTwo +
        "." +
        SearchColumn +
        "= " +
        mysql.escape(SearchValue),
        function(err, result) {
          if (err) {
            reject(err);
          } else {
            resolve(result);
          }
        }
      );
    });
  }



  /*This function implements a select query based on the session Id/User making this request*/

  static user_specific_select_query(
    tableName,
    ColumnName,
    value_,
    UserIdColumnName,
    UserId
  ) {
    return new Promise(function(resolve, reject) {
      var sql =
        "SELECT * FROM " +
        tableName +
        " WHERE " +
        ColumnName +
        " = " +
        mysql.escape(value_) +
        " AND " +
        UserIdColumnName +
        " = " +
        mysql.escape(UserId);
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

  /*This function gets the number of records in a table.*/

  static get_number_of_records(tableName, ColumnName, value_) {
    return new Promise(function(resolve, reject) {
      var sql =
        "SELECT COUNT(*) AS NumberOfRecords FROM " +
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

  /*SON/2018-11-06 00:29 - DEVELOPMENT

The two_table_inner_join() is used to conduct
an inner join query between two tables but
with no WHERE clause(No condition)

*/


  static getAUserRoles(userId) {
    return new Promise(function(resolve, reject) {
      con.query(
        "SELECT * FROM user_roles INNER JOIN roles ON user_roles.RoleId = roles.RoleId WHERE user_roles.UserId = " +
        mysql.escape(userId),
        function(err, result) {
          if (err) {
            reject(err);
          } else {
            resolve(result);
          }
        }
      );
    });
  }

  static getAUserAccessPrivileges(userRoleId) {
    return new Promise(function(resolve, reject) {
      con.query(
        "SELECT * FROM user_access_privileges INNER JOIN access_privileges ON user_access_privileges.AccessPrivilegeId = access_privileges.AccessPrivilegeId WHERE user_access_privileges.UserRoleId = " +
        mysql.escape(userRoleId),
        function(err, result) {
          if (err) {
            reject(err);
          } else {
            resolve(result);
          }
        }
      );
    });
  }

  static checkWhetherAUserHasACertainRole(userId, roleCode) {
    return new Promise(function(resolve, reject) {
      con.query(
        "SELECT * FROM roles INNER JOIN user_roles ON roles.RoleId = user_roles.RoleId WHERE roles.RoleCode = " +
        roleCode +
        " AND user_roles.UserId = " +
        userId +
        " AND user_roles.ConfirmationStatus = 1;",
        function(err, result) {
          if (err) {
            reject(err);
          } else {
            resolve(result);
          }
        }
      );
    });
  }

  static checkUserAllowedLoginWithCertainRole(userRoleId) {
    return new Promise(function(resolve, reject) {
      con.query(
        "SELECT * FROM user_roles INNER JOIN user_access_privileges ON user_roles.UserRoleId = user_access_privileges.UserRoleId INNER JOIN access_privileges ON access_privileges.AccessPrivilegeId = user_access_privileges.AccessPrivilegeId WHERE user_roles.UserRoleId = " +
        userRoleId +
        " AND access_privileges.AccessPrivilegeCode = 1 AND user_access_privileges.PermisionStatus = 1;",
        function(err, result) {
          if (err) {
            reject(err);
          } else {
            resolve(result);
          }
        }
      );
    });
  }


  // SELECT ProjectId, ObjectiveId FROM project_objective
  // WHERE ProjectId=1;


  static adminPageDisplay() {
    return new Promise(function(resolve, reject) {
      con.query("SELECT COUNT(ProjectId), ObjectiveId FROM project_objective GROUP BY ProjectId;", function(
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
  // static adminPageDisplay(tableName, ColumnName, value_) {
  //   return new Promise(function(resolve, reject) {
  //     var sql =
  //       "SELECT " +
  //       ColumnName +
  //       ColumnName +
  //       "FROM" +
  //       tableName +
  //       " WHERE " +
  //       ColumnName +
  //       " = " +
  //       mysql.escape(value_);
  //     con.query(sql, function(err, result) {
  //       if (err) {
  //         reject(err);
  //       } else {
  //         var returned_value_ = result;
  //         resolve(returned_value_);
  //       }
  //     });
  //   });
  // }


  static getAllTeamMembersByFullDescription() {
    return new Promise(function(resolve, reject) {
      con.query("SELECT * FROM team_members INNER JOIN team ON team.TeamId = team_members.TeamId INNER JOIN gender ON gender.GenderId = team_members.GenderId INNER JOIN company ON company.CompanyId = team_members.CompanyId;", function(
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




  static sumAllObjectivePercentages() {
    return new Promise(function(resolve, reject) {
      con.query("SELECT ProjectId, SUM(ObjectivePercentage) FROM objective_percentage GROUP BY ProjectId;",
        function(err, result, fields) {
          if (err) {
            reject(err);
          } else {
            var returned_value_ = result;
            resolve(returned_value_);
          }
        });
    });
  }


  static getAllProjectsByFullDescription() {
    return new Promise(function(resolve, reject) {
      con.query("SELECT * FROM project_objectives INNER JOIN projects ON projects.ProjectId = project_objectives.ProjectId;", function(
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



};