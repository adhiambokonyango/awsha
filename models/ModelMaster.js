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
const roles = require("user-groups-roles");
const Repository=require("../controllers/Repository");

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
            message: "Record updated successfully.",
            recordId: result.insertId
          };
          resolve(returned_value_);
        }
      });
    });
  }


  // batch_update_product_properties
  static batch_update_product_properties(tableName, jsonObject_, product_id) {
    return new Promise(function(resolve, reject) {
      con.query("UPDATE " + tableName + " SET ? WHERE ProductId = " +  mysql.escape(product_id), jsonObject_, function(
        err,
        result
      ) {
        if (err) {
          reject(err);
        } else {
          var returned_value_ = {
            success: true,
            message: "Record updated successfully.",
            recordId: result.insertId
          };
          resolve(returned_value_);
        }
      });
    });
  }
  // end

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
                  message: "Record updated succesfully.",
                  recordId: 0
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
      var selectSpecificPromise = ModelMaster.user_specific_select_query(
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
            returned_value_ = {
              success: false,
              message: "No such record exists",
              recordId:0,
            };

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

                var returned_value_ = {
                  success: true,
                  message: "Record Successfully Deleted",
                  recordId:0,
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
batch_program() is a special function that handles batch jobs.
*/

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

  // project Id specific query for objectives
  static project_specific_select_query(

    value_,

  ) {
    return new Promise(function(resolve, reject) {
      var sql =
        "SELECT * FROM objectives WHERE ProjectId = " +
        mysql.escape(value_)
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


  // project Id specific query for team
  static project_specific_select_query_for_teams(
    value_,
  ) {
    return new Promise(function(resolve, reject) {
      var sql =
        "SELECT * FROM teams WHERE ProjectId = " +
        mysql.escape(value_)
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


  // project Id specific query for teamMember
  static project_specific_select_query_for_team_members(
    value_,
  ) {
    return new Promise(function(resolve, reject) {
      var sql =
        "SELECT * FROM team_members WHERE TeamId = " +
        mysql.escape(value_)
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


  // project Id specific query for teamMember
  static project_specific_select_query_for_team_lead(
    value_,
  ) {
    return new Promise(function(resolve, reject) {
      var sql =
        "SELECT * FROM team_leaders WHERE TeamId = " +
        mysql.escape(value_)
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

  static get_number_of_records(tableName, ColumnName, value_, StateColumn, status_) {
    return new Promise(function(resolve, reject) {
      var sql =
        "SELECT COUNT(*) AS NumberOfRecords FROM " +
        tableName +
        " WHERE " +
        ColumnName +
        " = " + mysql.escape(value_) + " and " + StateColumn +
        " = " +
        mysql.escape(status_);
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

  // update_stocks
  // increase count of items checking in
  static stocks_update(tableName, jsonObject_, ColumnName, value_, product_id) {
    return new Promise(function(resolve, reject) {
      var selectSpecificPromise = ModelMaster.selectSpecific(
        tableName,
        ColumnName,
        value_,
        product_id
      );

      selectSpecificPromise.then(
        function(result) {
          var returned_value_ = result;

          if (returned_value_.length === 0) {
            returned_value_ = {
              success: false,
              message: "No such record exists",
              recordId: 0

            };
            resolve(returned_value_);
          } else {
            con.query(
              "UPDATE " +
              tableName +
              " SET ? WHERE " +
              ColumnName +
              " = " +
              mysql.escape(value_) +
              " AND ProductId = " + mysql.escape(product_id),
              jsonObject_,
              function(err, result) {
                if (err) {
                  reject(err);
                }

                var returned_value_ = {
                  success: true,
                  message: "Record updated successfully.",
                   recordId: 0
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
  // end


  // update_checked_out_stock
  // increase count of leaving items
  // with every leaving item, decreases stock by 1
  static update_checked_out_stock(tableName, jsonObject_, ColumnName, value_, product_id) {
    return new Promise(function(resolve, reject) {
      var selectSpecificPromise = ModelMaster.selectSpecific(
        tableName,
        ColumnName,
        value_,
        product_id
      );

      selectSpecificPromise.then(
        function(result) {
          var returned_value_ = result;

          if (returned_value_.length === 0) {
            returned_value_ = {
              success: false,
              message: "No such record exists",
              recordId: 0

            };
            resolve(returned_value_);
          } else {
            con.query(
              "UPDATE " +
              tableName +
              " SET ? WHERE " +
              ColumnName +
              " = " +
              mysql.escape(value_) +
              " AND ProductId = " + mysql.escape(product_id),
              jsonObject_,
              function(err, result) {
                if (err) {
                  reject(err);
                }
                if (result.changedRows > 0){
                  var sql = "UPDATE products set InStock = InStock - 1 WHERE ProductId = " + mysql.escape(product_id);
                  con.query(sql, function(err, result) {
                    if (err) {
                      reject(err);
                    } else {
                      resolve(result);
                    }
                  });
                }
                var returned_value_ = {
                  success: true,
                  message: "Record updated successfully.",
                  recordId: 0
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
  // end



  // update_status_for_checked_out_catalogue_item
  // inform system that product item has already left shelf
  static update_status_for_checked_out_catalogue_item(
    tableName, ColumnName, value_, catalogue_item_id, product_id, lotId) {
    let jsonObject_ = {
        Status: 1,
    };
    return new Promise(function(resolve, reject) {

            con.query(
              "UPDATE " +
              tableName +
              " SET ? WHERE " +
              ColumnName +
              " = " +
              mysql.escape(value_) +
              " AND CatalogueItemId = " + mysql.escape(catalogue_item_id) +
              " AND ProductId = " + mysql.escape(product_id),
              jsonObject_,
              function(err, result) {
                if (err) {
                  reject(err);
                }
                //   *  changedRows: 0
                if (result.changedRows > 0){
                  var sql = "UPDATE lots set CountOfCheckedOutItems = CountOfCheckedOutItems + 1 WHERE LotId = " + mysql.escape(lotId);
                  con.query(sql, function(err, result) {
                    if (err) {
                      reject(err);
                    } else {
                      resolve(result);
                    }
                  });
                }
                var returned_value_ = result;
                console.log(result)
                resolve(returned_value_);
              }
            );
     });
  }
  // end

  // expiry date
  static expired(ColumnName, lotId) {
    let obj  = {};
    return new Promise(function(resolve, reject) {
      var sql =
        "SELECT DATEDIFF(ExpiryDate, RegisteredDate) AS ExpiryPeriod FROM lots WHERE " +
        ColumnName + " = " +
        mysql.escape(lotId);
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
  // end



  // check_back_in
  // return product to shelf
  static check_back_in(
    tableName, ColumnName, value_, catalogue_item_id, product_id) {
    let jsonObject_ = {
      Status: 0,
    };
    return new Promise(function(resolve, reject) {

      con.query(
        "UPDATE " +
        tableName +
        " SET ? WHERE " +
        ColumnName +
        " = " +
        mysql.escape(value_) +
        " AND CatalogueItemId = " + mysql.escape(catalogue_item_id) +
        " AND ProductId = " + mysql.escape(product_id),
        jsonObject_,
        function(err, result) {
          if (err) {
            reject(err);
          }

          var returned_value_ = {
            success: true,
            message: "Record updated successfully.",
            recordId: 0,
          };
          resolve(returned_value_);
        }
      );
    });
  }
  // end


  // check_out_old_stock. Stock that has over
  // stayed and is not being accounted for
  static check_out_old_stock(
    tableName, ColumnName, value_, catalogue_item_id, product_id) {
    let jsonObject_ = {
      Status: 3,
    };
    return new Promise(function(resolve, reject) {

      con.query(
        "UPDATE " +
        tableName +
        " SET ? WHERE " +
        ColumnName +
        " = " +
        mysql.escape(value_) +
        " AND CatalogueItemId = " + mysql.escape(catalogue_item_id) +
        " AND ProductId = " + mysql.escape(product_id),
        jsonObject_,
        function(err, result) {
          if (err) {
            reject(err);
          }
          //   *  changedRows: 0
          var returned_value_ = {
            success: true,
            message: "Record updated successfully.",
            recordId: 0,
          };
          resolve(returned_value_);
        }
      );
    });
  }
  // end


  // update_checked_out_stock_after_depletion
  // make changes on column checked out once lot has all items checked out
  // ensures values dont fall below zero
  static update_checked_out_stock_after_depletion(tableName, jsonObject_, ColumnName, value_, product_id) {
    return new Promise(function(resolve, reject) {
      var selectSpecificPromise = ModelMaster.selectSpecific(
        tableName,
        ColumnName,
        value_,
        product_id
      );

      selectSpecificPromise.then(
        function(result) {
          var returned_value_ = result;

          if (returned_value_.length === 0) {
            returned_value_ = {
              success: false,
              message: "No such record exists",
              recordId: 0

            };
            resolve(returned_value_);
          } else {
            var sql = "UPDATE " +
              tableName +
              " SET ? WHERE " +
              ColumnName +
              " = " +
              mysql.escape(value_) +
              " AND ProductId = " + mysql.escape(product_id);
            con.query(
              sql,
              jsonObject_,
              function(err, result) {
                if (err) {
                  reject(err);
                }
                var returned_value_ = {
                  success: true,
                  message: "Record updated successfully.",
                  recordId: 0
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
  // end

  // individually updates checked and returns result as opposed to json object.
  // result used in controller
  // informs user on number of changed records
  static update_deplete(tableName, jsonObject_, ColumnName, value_) {
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

                var returned_value_ = result;
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



  // update products.CheckedOut, products.Instock along side with lots.CountOfCheckedOutItems
  static updateCheckedOutAndCountOfCheckedOut(tableName, jsonObject_, ColumnName, value_, product_id, lot_id) {
    return new Promise(function(resolve, reject) {
      var selectSpecificPromise = ModelMaster.selectSpecific(
        tableName,
        ColumnName,
        value_,
        product_id
      );

      selectSpecificPromise.then(
        function(result) {
          var returned_value_ = result;

          if (returned_value_.length === 0) {
            returned_value_ = {
              success: false,
              message: "No such record exists",
              recordId: 0

            };
            resolve(returned_value_);
          } else {
            con.query(
              "UPDATE " +
              tableName +
              " SET ? WHERE " +
              ColumnName +
              " = " +
              mysql.escape(value_) +
              " AND ProductId = " + mysql.escape(product_id),
              jsonObject_,
              function(err, result) {
                if (err) {
                  reject(err);
                }
                if (result.changedRows > 0){
                  var sql = "UPDATE products set InStock = InStock - 1 WHERE ProductId = " + mysql.escape(product_id);
                  con.query(sql, function(err, result) {
                    if (err) {
                      reject(err);
                    }
                    if (result.changedRows > 0){
                      var sql = "UPDATE lots set CountOfCheckedOutItems = CountOfCheckedOutItems + 1 WHERE LotId = " + mysql.escape(lot_id);
                      con.query(sql, function(err, result) {
                        if (err) {
                          reject(err);
                        } else {
                          resolve(result);
                        }
                      })
                      }
                  });
                }
                var returned_value_ = {
                  success: true,
                  message: "Record updated successfully.",
                  recordId: 0
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
  // end


};
