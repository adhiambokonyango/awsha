const Repository=require('../Repository');
const tableName="lots";
const ModelMaster=require('../../models/ModelMaster');


module.exports = class LotsController{

  static async insert(recordObject){
    let response = await Repository.insert(tableName,recordObject);
    return response;
  }

  static async selectAll(){
    return new Promise(function(resolve, reject) {
      let response = Repository.selectAll(tableName);
      response.then(function(fetch){
        for (let i=0;i<fetch.length;i++){
          console.log(fetch[i].LotId)
          let expired = LotsController.expired(fetch[i].LotId);
          expired.then(function(result){
              resolve(result);
          });
        }
      })
    });
  }

  static async select_all(){
    let response = await Repository.selectAllLots();
    return response;
  }

  static stocks_report() {
    return new Promise(function(resolve, reject) {
    let fetch =  LotsController.select_all();
    fetch.then(function(result){
      for (let i=0;i<result.length;i++){
        let update = LotsController.item_count(result[i].LotId);
        update.then(function(updated){
          resolve(result);
        })
      }
    })
  });
  }

  static async selectSpecific(columnName,columnValue){
    let response = await Repository.selectSpecific(tableName,columnName,columnValue);
    return response;
  }


  static async batchUpdate(batchObject){
    let response = await Repository.batch_update(tableName,batchObject);
    return response;
  }



  static async individualUpdate(columnName,columnValue,recordObject){
    let response = await Repository.individual_update(tableName,recordObject,columnName,columnValue);
    return response;
  }

  static expired(lotId) {
    let ColumnName = "LotId";
    return new Promise(function(resolve, reject) {
      var myPromise = ModelMaster.expired(ColumnName, lotId);
      myPromise.then(
        function(result) {
          var response_object = {
            ExpiryPeriod: result[0].ExpiryPeriod
          };

          setTimeout(function(){
            // update lot expiry status
            let jsonObject_ = {
              Expired: 1,
            };
            let expired_lot = ModelMaster.individual_update(tableName, jsonObject_, ColumnName, lotId);
            expired_lot.then(function(expiry){
              if (expiry.success === true){
                // update item expiry status
                let jsonObject = {
                  ExpiryStatus: 2,
                };
                let table_name = "catalogue_items";
                let expiry_status = ModelMaster.individual_update(table_name, jsonObject, ColumnName, lotId);
                expiry_status.then(function(status_){
                  if (status_.success === true){
                    let expired_lot = LotsController.expired_lot();
                    expired_lot.then(function(exp){
                        resolve(exp);
                    })

                  }
                });
              }
            })
            console.log("expired")
          }, result[0].ExpiryPeriod * 86400000)
        },
        function(err) {
          reject(err);
        }
      );
    });
  }

  static async expired_lot(){
    return new Promise(function(resolve, reject) {
      var response_object = {};
      let response = Repository.expired_lot();
      response.then(function(result){
        for (let i=0; i<result.length;i++){
          let expired_items = LotsController.expired_item_count(result[i].LotId);
          expired_items.then(function(expired){
            resolve(result);
          });
        }
      })
    });
  }


  // expired_item_count
  static expired_item_count( value_){
    let  ColumnName = "LotId";
    return new Promise(function(resolve, reject) {
      var myPromise = Repository.expired_item_count( ColumnName, value_);
      myPromise.then( function(result) {
        var response_object =result[0].NumberOfRecords;
        let jsonObj = {
          ExpiredItemCount: result[0].NumberOfRecords
        }
        let update = ModelMaster.individual_update(tableName, jsonObj, ColumnName, value_);
        update.then(function(updated){
          resolve(response_object);
        })
      }, function(err) {
        reject(err);
      })
    })
  }
  // end


  // item_count
  static item_count( value_){
    let  ColumnName = "LotId";
    return new Promise(function(resolve, reject) {
      var myPromise = Repository.item_count( ColumnName, value_);
      myPromise.then( function(result) {
        var response_object =result[0].NumberOfRecords;
        resolve(response_object);
        let jsonObj = {
          ItemCount: result[0].NumberOfRecords
        }

        let item_count = ModelMaster.individual_update(tableName, jsonObj, ColumnName, value_);
        item_count.then(function(update){
          resolve(update);
        })
      }, function(err) {
        reject(err);
      })
    })
  }
  // end

}
