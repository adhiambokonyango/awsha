const Repository=require('../Repository');
const tableName="catalogue_items";
const ModelMaster=require('../../models/ModelMaster');
const ProductController=require('../products/ProductController');
const LotsController = require('../lots/LotsController')
module.exports = class CatalogueItemsController{

  static async insert(recordObject){
    let response = await Repository.insert(tableName,recordObject);
    return response;
  }

  static async insert_unique_code(recordObject){
    let userValidationColumn = "Code";
    let responseObject = {};
    let projectRequestArray = await CatalogueItemsController
      .get_code_specific_records(userValidationColumn,recordObject.Code);
    if(projectRequestArray.length === 0) {
      let insertResponse = await Repository.insert(tableName,recordObject);
      responseObject = insertResponse;

    } else {
      responseObject = {
        success: false,
        message: "code already exists.",
        recordId:0,
      }
    }
    return responseObject;
  }

  static async selectAll(){
    let response = await Repository.selectAll(tableName);
    return response;
  }

  static async productsAndCatalogueItems(){
    let response = await Repository.productsAndCatalogueItems(tableName);
    return response;
  }

  static get_stock_records( value_){
   let  ColumnName = "ProductId";
    return new Promise(function(resolve, reject) {
      var myPromise = Repository.get_stock_records( ColumnName, value_);
      myPromise.then( function(result) {
        var response_object = result
        resolve(response_object);
      }, function(err) {
        reject(err);
      })
    })
  }

  static get_checked_out_records( value_){
    let  ColumnName = "ProductId";
    return new Promise(function(resolve, reject) {
      var myPromise = Repository.get_checked_out_records( ColumnName, value_);
      myPromise.then( function(result) {
        var response_object = result
        resolve(response_object);
      }, function(err) {
        reject(err);
      })
    })
  }


  static async selectSpecific(columnName,columnValue){
    let response = await Repository.selectSpecific(tableName,columnName,columnValue);
    return response;
  }


  static async batchUpdate(batchObject){
    let response = await Repository.batch_update(tableName,batchObject);
    return response;
  }


  static async individualUpdate(columnValue,recordObject){
    let columnName = "Status";
    let response = await Repository.individual_update(tableName,recordObject,columnName,columnValue);
    return response;
  }

  static get_number_of_records( value_, status_) {
    let ColumnName = "ProductId";
    let StateColumn = "Status";
    return new Promise(function(resolve, reject) {
      var myPromise = ModelMaster.get_number_of_records(
        tableName,
        ColumnName,
        value_,
        StateColumn,
        status_
      );
      myPromise.then(
        function(result) {
          var response_object = {
            NumberOfRecords: result[0].NumberOfRecords,
          }
          resolve(response_object);
        },
        function(err) {
          reject(err);
        }
      );
    });
  }

  static get_code_specific_records(ColumnName, value_) {
    return new Promise(function(resolve, reject) {
      let tableName = "catalogue_items";
      var myPromise = ModelMaster.selectSpecific(tableName, ColumnName, value_);
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

  // update_status_for_checked_out_catalogue_item
  static async update_status_for_checked_out_catalogue_item(columnValue, catalogue_item_id){
    let columnName = "Status";
    let response = await ModelMaster.update_status_for_checked_out_catalogue_item(tableName,columnName,columnValue, catalogue_item_id);
    return response;
  }

  // insert existing catalogue item
  static async insert_existing_code(recordObject){
    let userValidationColumn = "Code";
    let responseObject = {};
    let projectRequestArray = await ModelMaster.selectSpecific(tableName,userValidationColumn,recordObject.Code);
   if(projectRequestArray.length > 0) {
        let oldStock = await CatalogueItemsController.getOldCheckedOutRecords(projectRequestArray[0].ProductId);

        let columnName = "Status";
        let  columnValue = projectRequestArray[0].Status;
        let catalogue_item_id = projectRequestArray[0].CatalogueItemId;
        let product_id = projectRequestArray[0].ProductId;
        let lotId = projectRequestArray[0].LotId
        let updateResponse = await ModelMaster.update_status_for_checked_out_catalogue_item(tableName,columnName,columnValue, catalogue_item_id, product_id, lotId);

      if (updateResponse.success === true){
        let checked_out_stock = await CatalogueItemsController.get_checked_out_records(product_id);
        if (checked_out_stock[0].NumberOfRecords > 0){
          var newStock = {
            CheckedOut: checked_out_stock[0].NumberOfRecords,
          };
          let product_checked_out_stock =
            await ProductController.update_checked_out_stock(oldStock[0].NumberOfRecords, newStock, product_id);
          responseObject = product_checked_out_stock;
        } else {
          responseObject = {
            success: false,
            message: "checked_out_stock === 0.",
            recordId:0,
          }
        }

        // check depleted stock
        let  ColumnName = "LotId";
        let itemCount = await Repository.item_count(ColumnName, lotId);
        let item = itemCount[0].NumberOfRecords;
        let lot_ = await Repository.selectSpecificLots(lotId);
        let lot = lot_[0].CountOfCheckedOutItems;
        console.log(lot, item)
        if (lot === item){
          let deplete = {
            Depleted: 4
          };
          let table_name = "lots";
          // tableName, jsonObject_, ColumnName, value_
          let depletionUpdate = await ModelMaster.individual_update_checked_out(table_name, deplete, ColumnName, lotId);
          if (depletionUpdate.changedRows > 0){
            console.log("depletionUpdate")

            // update checked_out column
            let checked_out_stock = await CatalogueItemsController.get_checked_out_records(product_id);
            if (checked_out_stock[0].NumberOfRecords > 0) {
              var newStockAfterDepletion = {
                CheckedOut: checked_out_stock[0].NumberOfRecords - lot
              };

              let product_checked_out_stock_after_depletion =
                await ProductController.update_checked_out_stock_after_depletion(checked_out_stock[0].NumberOfRecords, newStockAfterDepletion, product_id);
              responseObject = product_checked_out_stock_after_depletion;
            } else {
              responseObject = {
                success: false,
                message: "checked out < 0.",
                recordId:0,
              }
            }
            // end

          } else {
            responseObject = {
              success: false,
              message: "lots' Depleted update failed.",
              recordId:0,
            }
          }

        }
        // end check

      } else {
        responseObject = {
          success: false,
          message: "updateResponse.success === false.",
          recordId:0,
        }
      }
     await CatalogueItemsController.get_stock_records(projectRequestArray[0].ProductId);
    } else {
      responseObject = {
        success: false,
        message: "code does not exists.",
        recordId:0,
      }
    }

    return responseObject;
  }
  // end
  // get old checked out records
  static async getOldCheckedOutRecords(product_id){
    let obj = {};
    let stock = await CatalogueItemsController.get_checked_out_records(product_id);
    obj = stock;
    return obj;
  }


  // insert unique catalogue item
  static async insert_unique_catalogue_item(recordObject){
    let userValidationColumn = "Code";
    let responseObject = {};
    let projectRequestArray = await CatalogueItemsController.get_code_specific_records(userValidationColumn,recordObject.Code);
    let oldStock = await CatalogueItemsController.getOldStockRecords(recordObject.ProductId);
    console.log(oldStock[0].NumberOfRecords)
    if(projectRequestArray.length === 0) {
      let insertResponse = await Repository.insert(tableName,recordObject);
      if (insertResponse.success === true){
        let stock = await CatalogueItemsController.get_stock_records(recordObject.ProductId);
        if (stock[0].NumberOfRecords > 0){
          let product_id = recordObject.ProductId;
          var newStock = {
            InStock: stock[0].NumberOfRecords,
          };
          let new_stock = await
            ProductController.individualUpdate(oldStock[0].NumberOfRecords, newStock, product_id);
          responseObject = new_stock;
        } else {
          responseObject = {
            success: false,
            message: "stock[0].NumberOfRecords === 0.",
            recordId:0,
          }
        }
      } else {
        responseObject = {
          success: false,
          message: "insertResponse.success === false.",
          recordId:0,
        }
      }
    } else {
      responseObject = {
        success: false,
        message: "code already exists.",
        recordId:0,
      }
    }
    return responseObject;
  }
  // end

  // get old stock records
  static async getOldStockRecords(product_id){
    let obj = {};
    let stock = await CatalogueItemsController.get_stock_records(product_id);
    obj = stock;
    return obj;
  }


  // check back in
  static async check_back_in_existing_code(recordObject){
    let userValidationColumn = "Code";
    let responseObject = {};
    let projectRequestArray =
      await ModelMaster.selectSpecific(tableName,userValidationColumn,recordObject.Code);
    if(projectRequestArray.length > 0) {
      let columnName = "Status";
      let  columnValue = projectRequestArray[0].Status;
      let catalogue_item_id = projectRequestArray[0].CatalogueItemId;
      let product_id = projectRequestArray[0].ProductId;
      let updateResponse =
        await ModelMaster.check_back_in(tableName,columnName,columnValue, catalogue_item_id, product_id);
      if (updateResponse.success === true){
        responseObject = updateResponse;
      } else {
        responseObject = {
          success: false,
          message: "code not found.",
          recordId:0,
        }
      }
    }
    return responseObject;
  }
  // end


  // check_out_old_stock
  static async check_out_old_stock(recordObject){
    let userValidationColumn = "Code";
    let responseObject = {};
    let projectRequestArray =
      await ModelMaster.selectSpecific(tableName,userValidationColumn,recordObject.Code);
    if(projectRequestArray.length > 0) {
      let columnName = "Status";
      let  columnValue = projectRequestArray[0].Status;
      let catalogue_item_id = projectRequestArray[0].CatalogueItemId;
      let product_id = projectRequestArray[0].ProductId;
      let updateResponse =
        await ModelMaster.check_out_old_stock(tableName,columnName,columnValue, catalogue_item_id, product_id);
      if (updateResponse.success === true){
        responseObject = updateResponse;
      } else {
        responseObject = {
          success: false,
          message: "code not found.",
          recordId:0,
        }
      }
    }
    return responseObject;
  }
  // end
}
