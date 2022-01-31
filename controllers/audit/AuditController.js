
const ModelMaster = require('../../models/ModelMaster');
module.exports = class AuditController {
  constructor() {}

  static innerJoinAuditAndProducts(tableOne, tableTwo, joiningKey, searchColumn, searchValue) {
    return new Promise( function(resolve, reject) {
      let fetch = ModelMaster.two_table_inner_join(
        tableOne,
        tableTwo,
        joiningKey,
        searchColumn,
        searchValue
      );
      fetch.then(function(result) {
        resolve(result);
      }, function(err) {
        reject(err);
      })

    });
  }
}