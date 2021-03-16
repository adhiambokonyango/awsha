const Repository=require('../Repository');
const tableName="lots";
const ModelMaster=require('../../models/ModelMaster');
const cron = require('node-cron');
const CatalogueItemsController = require('../products/CatalogueItemsController')
const ProductController = require('../products/ProductController')


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
          let expired = ModelMaster.expired(fetch[i].LotId);
          expired.then(function(result){
              resolve(result);
          });
        }
      })
    });
  }

  static async selectAllLots(user_id){
    let response = await Repository.selectAllLots(user_id);
    return response;

  }

  static async selectAllCreatedByUser(user_id){
    let response = await Repository.selectAllCreatedByUser(tableName, user_id);
    return response;
  }

  static filter(user_id) {
    return new Promise(function(resolve, reject) {
      let user_fetch = LotsController.selectAllCreatedByUser(user_id);
      user_fetch.then(function(result){
        for (let i=0;i<result.length;i++){
          let cross_fetch = LotsController.selectSpecificLots(result[i].LotId);
          cross_fetch.then(function(fetch){
            resolve(fetch);
          })
        }
      })
    })} // end

    // lot that has gone through full circle: out of stock
  static async depletedStock(userId){
    let response = await Repository.depletedStock(userId);
    return response;
  } // end

  // detail on how many items were checked in
  static stocks_report(user_id) {
    return new Promise(function(resolve, reject) {
    let fetch =  LotsController.selectAllLots(user_id);
    fetch.then(function(result){
      resolve(result);
    })
  });
  }

  // item_count column contains total count of items in each lot
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


  static async delete(value_, user_id){
    // tableName, ColumnName, value_, UserIdColumnName, UserId
    let ColumnName = "LotId";
    let UserIdColumnName = "UserId";
    let response = await ModelMaster.delete(tableName, ColumnName, value_, UserIdColumnName, user_id);
    return response;
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





  // end  LotId, ProductId RegisteredDate ExpiryDate ItemCount ExpiredItemCount Expired


  // specific_lot_fetch
  static selectSpecificLots(lotId){
    return new Promise(function(resolve, reject) {
      var myPromise = Repository.selectSpecificLots(lotId);
      myPromise.then( function(result) {
        var response_object =result;
        resolve(response_object);

      }, function(err) {
        reject(err);
      })
    })
  }
  // end


}// end class
