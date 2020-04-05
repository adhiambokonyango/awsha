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

  /*SON/2018-11-06 00:29 - DEVELOPMENT
	
The selectSpecific() is to select specific a
record(s) on the table depending on the 
arguments you pass to it.Pass it the table 
name and a callback function to retrieve back
your result

*/
  static selectSpecific_with_two_AND_searchkeys(
    tableName,
    ColumnNameOne,
    ValueOne,
    ColumnNameTwo,
    ValueTwo
  ) {
    return new Promise(function(resolve, reject) {
      var sql =
        "SELECT * FROM " +
        tableName +
        " WHERE " +
        ColumnNameOne +
        " = " +
        mysql.escape(ValueOne) +
        " AND " +
        ColumnNameTwo +
        " = " +
        mysql.escape(ValueTwo);
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
	
The selectSpecific() is to select specific a
record(s) on the table depending on the 
arguments you pass to it.Pass it the table 
name and a callback function to retrieve back
your result

*/
  static selectSpecific_with_three_AND_searchkeys_and_bounds(
    tableName,
    ColumnNameOne,
    ValueOne,
    ColumnNameTwo,
    ValueTwo,
    ValueThree,
    ColumnThree,
    ColumnFour
  ) {
    return new Promise(function(resolve, reject) {
      var sql =
        "SELECT * FROM " +
        tableName +
        " WHERE " +
        ColumnNameOne +
        " = " +
        mysql.escape(ValueOne) +
        " AND " +
        ColumnNameTwo +
        " = " +
        mysql.escape(ValueTwo) +
        " AND " +
        ValueThree +
        " BETWEEN " +
        ColumnThree +
        " AND " +
        ColumnFour;
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
	
The selectSpecific() is to select specific a
record(s) on the table depending on the 
arguments you pass to it.Pass it the table 
name and a callback function to retrieve back
your result

*/
  static select_two_searchkeys_and_bounds(
    tableName,
    ColumnNameOne,
    ValueOne,
    ValueTwo,
    ColumnTwo,
    ColumnThree
  ) {
    return new Promise(function(resolve, reject) {
      var sql =
        "SELECT * FROM " +
        tableName +
        " WHERE " +
        tableName +
        "." +
        ColumnNameOne +
        "=" +
        mysql.escape(ValueOne) +
        " AND " +
        mysql.escape(ValueTwo) +
        " BETWEEN " +
        tableName +
        "." +
        ColumnTwo +
        " AND " +
        tableName +
        "." +
        ColumnThree +
        ";";
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
            message: "Record updated succesfully."
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

  static update_with_two_AND_searchkeys(
    TableName,
    JsonObject,
    ColumnOne,
    ValueOne,
    ColumnTwo,
    ValueTwo
  ) {
    return new Promise(
      function(resolve, reject) {
        con.query(
          "UPDATE " +
            TableName +
            " SET ? WHERE " +
            ColumnOne +
            " = " +
            mysql.escape(ValueOne) +
            " AND " +
            ColumnTwo +
            " = " +
            mysql.escape(ValueTwo),
          JsonObject,
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
      },
      function(err) {
        console.log(err);
      }
    );
  }

  /*SON/2018-11-06 00:29 - DEVELOPMENT
	
individual_update() updates a specific record(s).

*/

  static individual_update_with_two_AND_searchkeys(
    TableName,
    ColumnOneToBeSet,
    ValueOneToBeSet,
    ColumnTwoToBeSet,
    ValueTwoToBeSet,
    ColumnOne,
    ValueOne,
    ColumnTwo,
    ValueTwo
  ) {
    return new Promise(
      function(resolve, reject) {
        con.query(
          "UPDATE " +
            TableName +
            " SET " +
            ColumnOneToBeSet +
            "=" +
            mysql.escape(ValueOneToBeSet) +
            "," +
            ColumnTwoToBeSet +
            "=" +
            mysql.escape(ValueTwoToBeSet) +
            " WHERE " +
            ColumnOne +
            " = " +
            mysql.escape(ValueOne) +
            " AND " +
            ColumnTwo +
            " = " +
            mysql.escape(ValueTwo),
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
      },
      function(err) {
        console.log(err);
      }
    );
  }

  /*SON/2018-11-06 00:29 - DEVELOPMENT
	
individual_update() updates a specific record(s).

*/

  static three_updates_with_two_AND_searchkeys(
    TableName,
    ColumnOneToBeSet,
    ValueOneToBeSet,
    ColumnTwoToBeSet,
    ValueTwoToBeSet,
    ColumnThreeToBeSet,
    ValueThreeToBeSet,
    ColumnOne,
    ValueOne,
    ColumnTwo,
    ValueTwo
  ) {
    return new Promise(
      function(resolve, reject) {
        con.query(
          "UPDATE " +
            TableName +
            " SET " +
            ColumnOneToBeSet +
            "=" +
            mysql.escape(ValueOneToBeSet) +
            "," +
            ColumnTwoToBeSet +
            "=" +
            mysql.escape(ValueTwoToBeSet) +
            "," +
            ColumnThreeToBeSet +
            "=" +
            mysql.escape(ValueThreeToBeSet) +
            " WHERE " +
            ColumnOne +
            " = " +
            mysql.escape(ValueOne) +
            " AND " +
            ColumnTwo +
            " = " +
            mysql.escape(ValueTwo),
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
      },
      function(err) {
        console.log(err);
      }
    );
  }

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

  /*SON/2018-11-06 00:29 - DEVELOPMENT
	
batch_program() is a special function that handles batch jobs.

*/

  static batch_program() {
    return new Promise(function(resolve, reject) {
      if (err) {
        reject(err);
      }
      con.query("SELECT * FROM users", function(err, result, fields) {
        if (err) throw err;
        for (var i = 0; i < result.length; i++) {
          con.query(
            "SELECT * FROM users WHERE users.id = " + result[i].id,
            function(err, result) {
              if (err) {
                reject(err);
              }
              resolve(result);
            }
          );
        }
      });
    });
  }

  /*SON/2018-11-06 00:29 - DEVELOPMENT
	
The two_table_inner_join() is used to conduct
an inner join query between two tables

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

  /*SON/2018-11-06 00:29 - DEVELOPMENT
	
The two_table_inner_join() is used to conduct
an inner join query between two tables

*/

  static two_table_inner_join_searchKeys_on_each_table(
    TableOne,
    TableTwo,
    JoiningKey,
    SearchColumnOne,
    SearchValueOne,
    SearchColumnTwo,
    SearchValueTwo
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
          TableOne +
          "." +
          SearchColumnOne +
          "= " +
          mysql.escape(SearchValueOne) +
          " AND " +
          TableTwo +
          "." +
          SearchColumnTwo +
          "=" +
          mysql.escape(SearchValueTwo),
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

  /*SON/2018-11-06 00:29 - DEVELOPMENT
	
The two_table_inner_join() is used to conduct
an inner join query between two tables

*/

  static two_table_inner_join_with_no_condition(
    TableOne,
    TableTwo,
    JoiningKey
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
          JoiningKey,
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

  /*SON/2018-11-06 00:29 - DEVELOPMENT
	
The two_table_inner_join() is used to conduct
an inner join query between two tables

*/

  static two_table_inner_join_two_AND_searchkeys(
    TableOne,
    TableTwo,
    JoiningKey,
    SearchColumnOne,
    SearchValueOne,
    SearchColumnTwo,
    SearchValueTwo
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
          SearchColumnOne +
          "= " +
          mysql.escape(SearchValueOne) +
          " AND " +
          TableTwo +
          "." +
          SearchColumnTwo +
          "= " +
          mysql.escape(SearchValueTwo),
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

  /*SON/2018-11-06 00:29 - DEVELOPMENT
	
The two_table_inner_join() is used to conduct
an inner join query between two tables

*/

  static inverted_two_table_inner_join(
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
          TableOne +
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

  /*SON/2018-11-06 00:29 - DEVELOPMENT
	
The three_table_one_parent_with_searchkey_inner_join() is used to conduct
an inner join query between three tables where one table(TableOne) is the parent 
of the other two,and there is a WHERE clause

*/

  static three_table_one_parent_with_searchkey_inner_join(
    TableOne,
    TableTwo,
    TableThree,
    JoiningKeyOne,
    JoiningKeyTwo,
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
          JoiningKeyOne +
          " = " +
          TableTwo +
          "." +
          JoiningKeyOne +
          " INNER JOIN " +
          TableThree +
          " ON " +
          TableOne +
          "." +
          JoiningKeyTwo +
          " = " +
          TableThree +
          "." +
          JoiningKeyTwo +
          " WHERE " +
          TableOne +
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

  /*SON/2018-11-06 00:29 - DEVELOPMENT
	
The three_table_one_parent_with_searchkey_inner_join() is used to conduct
an inner join query between three tables where one table(TableOne) is the parent 
of the other two,and there is a WHERE clause

*/

  static three_table_linear_inner_join(
    TableOne,
    TableTwo,
    TableThree,
    JoiningKeyOne,
    JoiningKeyTwo,
    SearchColumn,
    SearchValue
  ) {
    return new Promise(function(resolve, reject) {
      con.query(
        "SELECT * FROM `academic_class_levels` INNER JOIN `classes` ON `academic_class_levels`.`AcademicClassLevelId`=`classes`.`AcademicClassLevelId` INNER JOIN `students` ON `classes`.`ClassId`=`students`.`ClassId` WHERE `students`.`ClassId`=5;",
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

  /*SON/2018-11-06 00:29 - DEVELOPMENT
	
The three_table_one_parent_no_searchkey_inner_join() is used to conduct
an inner join query between three tables where one table(TableOne) is the parent 
of the other two,and there is no WHERE clause

*/

  static three_table_one_parent_no_searchkey_inner_join(
    TableOne,
    TableTwo,
    TableThree,
    JoiningKeyOne,
    JoiningKeyTwo
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
          JoiningKeyOne +
          " = " +
          TableTwo +
          "." +
          JoiningKeyOne +
          " INNER JOIN " +
          TableThree +
          " ON " +
          TableOne +
          "." +
          JoiningKeyTwo +
          " = " +
          TableThree +
          "." +
          JoiningKeyTwo,
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

  /*SON/2018-11-06 00:29 - DEVELOPMENT
	
batch_program() is a special function that handles batch jobs.

*/

  static concatenate_two_query_results() {
    return new Promise(function(resolve, reject) {
      if (err) {
        reject(err);
      }
      con.query("SELECT * FROM users", function(err, result, fields) {
        if (err) throw err;
        for (var i = 0; i < result.length; i++) {
          con.query(
            "SELECT * FROM users WHERE users.id = " + result[i].id,
            function(err, result) {
              if (err) {
                reject(err);
              }
              resolve(result);
            }
          );
        }
      });
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

  static two_table_inner_join_with_no_condition(
    TableOne,
    TableTwo,
    JoiningKey
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
          JoiningKey,
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

  static getCompanyOwnersCompanyDetails(companyOwnerId) {
    return new Promise(function(resolve, reject) {
      con.query(
        "SELECT * FROM company_ownership_groups INNER JOIN ownership_groups_company_owners_rship ON company_ownership_groups.CompanyOwnershipGroupId = ownership_groups_company_owners_rship.CompanyOwnershipGroupId INNER JOIN company_owners ON ownership_groups_company_owners_rship.CompanyOwnerId = company_owners.CompanyOwnerId INNER JOIN companies ON company_ownership_groups.CompanyOwnershipGroupId = companies.CompanyOwnershipGroupId WHERE company_owners.CompanyOwnerId = " +
          companyOwnerId +
          ";",
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

  static getSystemUserCompanyDetails(SystemUserId) {
    return new Promise(function(resolve, reject) {
      con.query(
        "SELECT * FROM companies INNER JOIN company_branches ON companies.CompanyId = company_branches.CompanyId INNER JOIN company_system_users ON company_system_users.CompanyBranchId = company_branches.CompanyBranchId WHERE company_system_users.SystemUserId = " +
          SystemUserId +
          ";",
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


  static searchClientsByAnyParameter(searchParameter) {
    return new Promise(function(resolve, reject) {
      con.query(
        "SELECT * FROM company_clients INNER JOIN employment_categories ON company_clients.EmploymentCategoryId = employment_categories.EmploymentCategoryId WHERE ClientFirstName LIKE '%"+searchParameter+"%' OR ClientMiddleName LIKE '%"+searchParameter+"%' OR ClientSurname LIKE '%"+searchParameter+"%' OR ClientNationalId LIKE '%"+searchParameter+"%' OR ClientDOB LIKE '%"+searchParameter+"%' OR ClientPhoneNumber LIKE '%"+searchParameter+"%' \n" +
        "OR ClientPhysicalAddress LIKE '%"+searchParameter+"%' OR ClientEmail LIKE '%"+searchParameter+"%';",
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


  static selectAllFromSystemClientsInnerJoinEmploymentCategories() {
    return new Promise(function(resolve, reject) {
      con.query("SELECT * FROM company_clients INNER JOIN employment_categories ON company_clients.EmploymentCategoryId = employment_categories.EmploymentCategoryId;", function(
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


  static getIfClientHasIncompleteLoanWithCurrentCompany(clientId,companyId) {
    return new Promise(function(resolve, reject) {
      con.query("SELECT * FROM loan_application WHERE ClientId ="+clientId+" AND CompanyId ="+companyId+" AND IsFullyPaid =0;", function(
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




  static updateClientLoanStatus(jsonObject,ClientId,CompanyId) {
    return new Promise(function(resolve, reject) {
      con.query(
        "UPDATE loan_application SET ? WHERE ClientId ="+ClientId+" AND CompanyId ="+CompanyId+";",
        jsonObject,
        function(err) {
          if (err) {
            reject(err);
          } else {

          var returned_value_ = {
            success: true,
            message: "Record updated succesfully."
          };
          resolve(returned_value_);}
        }
      );
    });
  }


  static getACompaniesPendingLoans(companyId,isFullyPaidStatus) {
    return new Promise(function(resolve, reject) {
      con.query("SELECT * FROM loan_application WHERE CompanyId ="+companyId+" AND IsFullyPaid ="+isFullyPaidStatus+";", function(
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



  static getACompaniesSystemUsers(companyId) {
    return new Promise(function(resolve, reject) {
      con.query("SELECT * FROM companies INNER JOIN company_branches ON companies.CompanyId = company_branches.CompanyId INNER JOIN company_system_users ON company_branches.CompanyBranchId = company_system_users.CompanyBranchId WHERE companies.CompanyId ="+companyId+";", function(
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



  static getAllCompanyOwnersAndTheirDetails() {
    return new Promise(function(resolve, reject) {
      con.query(
        "SELECT * FROM company_ownership_groups INNER JOIN ownership_groups_company_owners_rship ON company_ownership_groups.CompanyOwnershipGroupId = ownership_groups_company_owners_rship.CompanyOwnershipGroupId INNER JOIN company_owners ON ownership_groups_company_owners_rship.CompanyOwnerId = company_owners.CompanyOwnerId INNER JOIN companies ON company_ownership_groups.CompanyOwnershipGroupId = companies.CompanyOwnershipGroupId;",
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


  static getACompaniesClientsWithPendingLoans(companyId,isFullyPaidStatus) {
    return new Promise(function(resolve, reject) {
      con.query("SELECT * FROM company_clients INNER JOIN loan_application ON company_clients.ClientId = loan_application.ClientId INNER JOIN companies ON loan_application.CompanyId = companies.CompanyId INNER JOIN company_branches ON loan_application.CompanyBranchId = company_branches.CompanyBranchId INNER JOIN employment_categories ON loan_application.EmploymentCategoryId = employment_categories.EmploymentCategoryId WHERE loan_application.CompanyId ="+companyId+" AND loan_application.IsFullyPaid ="+isFullyPaidStatus+";", function(
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






