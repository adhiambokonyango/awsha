const Repository=require('../Repository');
const tableName="catalogue_items";
const ModelMaster=require('../../models/ModelMaster');
const ProductController=require('../products/ProductController');

module.exports = class CatalogueItemsController{

  static async insert(recordObject){
    let response = await Repository.insert(tableName,recordObject);
    return response;
  }

  static async insert_unique_code(recordObject){
    let userValidationColumn = "Code";
    let responseObject = {};
    let projectRequestArray = await CatalogueItemsController.get_code_specific_records(userValidationColumn,recordObject.Code);
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
        var response_object = { NumberOfRecords: result[0].NumberOfRecords }
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
    let oldStock = await CatalogueItemsController.getOldCheckedOutRecords(projectRequestArray[0].ProductId);
    if(projectRequestArray.length > 0) {
        let columnName = "Status";
        let  columnValue = projectRequestArray[0].Status;
        let catalogue_item_id = projectRequestArray[0].CatalogueItemId;
        let product_id = projectRequestArray[0].ProductId;
        let updateResponse = await ModelMaster.update_status_for_checked_out_catalogue_item(tableName,columnName,columnValue, catalogue_item_id);

      if (updateResponse.success === true){
        let checked_out_stock = await CatalogueItemsController.get_checked_out_records(product_id);
          var newStock = {
            CheckedOut: checked_out_stock[0].NumberOfRecords,
          };
          let product_checked_out_stock =
            await ProductController.update_checked_out_stock(oldStock[0].NumberOfRecords, newStock, product_id);
        responseObject = product_checked_out_stock;
      } else {
        responseObject = {
          success: false,
          message: "updateResponse.success === false.",
          recordId:null,
        }
      }
    } else {
      responseObject = {
        success: false,
        message: "code does not exists.",
        recordId:null,
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
    if(projectRequestArray.length === 0) {
      let insertResponse = await Repository.insert(tableName,recordObject);
      if (insertResponse.success === true){
        let stock = CatalogueItemsController.get_stock_records(projectRequestArray[0].ProductId);
        if (stock > 0){
          let new_stock = ProductController.individualUpdate();
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

}
