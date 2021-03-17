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


  static async selectSpecific(columnValue){
    let ColumnName = "CatalogueItemId";
    let response = await Repository.selectSpecific(tableName,ColumnName,columnValue);
    return response;
  }

  static async getSpecificCode( first_value, second_value){
    let first_column = "Code";
    let second_column = "UserId";
    let response = await CatalogueItemsController.selectSpecificWithTwoParameters( first_column, first_value, second_column, second_value)
    return response;
  }

  static async selectSpecificWithTwoParameters(first_column, first_value, second_column, second_value){
    let response = await ModelMaster.selectSpecificWithTwoParameters(tableName, first_column, first_value, second_column, second_value)
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
  // when checked out, update status to 1
  static async update_status_for_checked_out_catalogue_item(columnValue, catalogue_item_id){
    let columnName = "Status";
    let response = await ModelMaster.update_status_for_checked_out_catalogue_item(tableName,columnName,columnValue, catalogue_item_id);
    return response;
  }

  // insert existing catalogue item
  static async insert_existing_code(recordObject){
    let userValidationColumn = "Code";
    let responseObject = {};
    // check if code is in the database
    let projectRequestArray = await ModelMaster.selectSpecific(tableName,userValidationColumn,recordObject.Code);
   if(projectRequestArray.length > 0) {
        let oldStock = await CatalogueItemsController.getOldCheckedOutRecords(projectRequestArray[0].ProductId);

     // check if catalogue_items.Counter = 0, then update status of item
     let counter = projectRequestArray[0].Counter;
     let has_many = projectRequestArray[0].HasManyItems;
     if (counter === 1 && has_many === 0){
       // if code exists, update status to 1 to check it out
       let columnName = "Status";
       let  columnValue = projectRequestArray[0].Status;
       let catalogue_item_id = projectRequestArray[0].CatalogueItemId;
       let product_id = projectRequestArray[0].ProductId;
       let lotId = projectRequestArray[0].LotId
       let updateResponse = await ModelMaster.update_status_for_checked_out_catalogue_item(tableName,columnName,columnValue, catalogue_item_id, product_id, lotId);
       // if update is successful, update CheckedOut column on products
       if (updateResponse.changedRows > 0){
         let checked_out_stock = await CatalogueItemsController.get_checked_out_records(product_id);
         if (checked_out_stock[0].NumberOfRecords > 0){
           var newStock = {
             CheckedOut: checked_out_stock[0].NumberOfRecords,
           };
           let product_checked_out_stock =
             await ProductController.update_checked_out_stock(oldStock[0].NumberOfRecords, newStock, product_id);
           responseObject = product_checked_out_stock;
           if (product_checked_out_stock.success === true){
             // check depleted stock
             // depleted value reached and trying to ensure values do not fall below zero
             // depleted stock id reached at when item_count === CountOfCheckedOutItems in lots
             let  ColumnName = "LotId";
             let lot_table = "lots"
             let lot_ = await ModelMaster.selectSpecific(lot_table,ColumnName,lotId);
             console.log(lot_)
             //  Repository.selectSpecificLots(lotId);
             let item = lot_[0].ItemCount; // count of all items
             let countOfCheckedOutItems = lot_[0].CountOfCheckedOutItems; // determined each time an item is checked out
             console.log(countOfCheckedOutItems, item)
             if (countOfCheckedOutItems === item){ // if equal, set depleted status to 4
               let deplete = {
                 Depleted: 4
               };
               let table_name = "lots";
               // updating depleted status
               let depletionUpdate = await ModelMaster.update_deplete(table_name, deplete, ColumnName, lotId);
               if (depletionUpdate.changedRows > 0){
                 console.log("depletionUpdate")

                 // update checked_out column by ensuring values do not fall below zero
                 // only subtract item count from CheckedOut when its value is above zero
                 let checked_out_stock = await CatalogueItemsController.get_checked_out_records(product_id);
                 if (checked_out_stock[0].NumberOfRecords > 0) {
                   var newStockAfterDepletion = {
                     CheckedOut: checked_out_stock[0].NumberOfRecords - countOfCheckedOutItems
                   };

                   // update products.CheckedOut after all items are finished,
                   //ensuring in_stock or checked_out do not fall below zero
                   let product_checked_out_stock_after_depletion =
                     await ProductController.update_checked_out_stock_after_depletion(checked_out_stock[0].NumberOfRecords, newStockAfterDepletion, product_id);
                   responseObject = product_checked_out_stock_after_depletion;
                 } else {
                   responseObject = {
                     success: false,
                     message: "products.CheckedOut < 0.",
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
           }
         } else {
           responseObject = {
             success: false,
             message: "checked_out_stock === 0.",
             recordId:0,
           }
         }



       } else {
         responseObject = {
           success: false,
           message: "no record updated",
           recordId:0,
         }
       }
     }//end of single code with catalogue_items.Counter === 1
     else if (counter >= 1 && has_many === 1){ // several items are sharing one code
       let jsonObject = {
         Counter: projectRequestArray[0].Counter - 1
       };
       console.log( jsonObject);

       let ColumnName = "CatalogueItemId";
       let catalogue_item_id = projectRequestArray[0].CatalogueItemId;
       // update counter on catalogue item
       let counter_update = await Repository.individual_update(tableName, jsonObject, ColumnName, catalogue_item_id);
       if(counter_update.success === true){
         responseObject = {
           success: true,
           message: "one item taken off the shelf.",
           recordId:0,
         }

         // once counter has reduced and been updated, reduce stock and increase checked out
         // by 1 each
         let product_select = await ProductController.selectSpecific(projectRequestArray[0].ProductId);
         let in_stock = product_select[0].InStock;
         let checked_out_stock = product_select[0].CheckedOut;

         let current_stock_value = {
           InStock: product_select[0].InStock - 1
         }

         let updated_checked_value = {
           CheckedOut: product_select[0].CheckedOut + 1
         }

         // count of checked out items updated manually to ensure balance
         let manualCountOfCheckedOut = {
           CountOfCheckedOutItems: projectRequestArray[0].CountOfCheckedOutItems + 1
         }
         // end

       //  await ProductController.individualUpdate(in_stock, current_stock_value, projectRequestArray[0].ProductId);
        let stock_update =  await ProductController.updateCheckedOutAndCountOfCheckedOut(checked_out_stock, updated_checked_value, projectRequestArray[0].ProductId, projectRequestArray[0].LotId);
         if (stock_update.success === true){
           let  ColumnName = "LotId";
           let lot_table = "lots"

           let lot_identified = await ModelMaster.selectSpecific(lot_table,ColumnName,projectRequestArray[0].LotId);
           if (lot_identified.length > 0){


             // count of checked out items updated manually to ensure balance
             let manualCountOfCheckedOut = {
               CountOfCheckedOutItems: lot_identified[0].CountOfCheckedOutItems + 1
             };
             console.log(manualCountOfCheckedOut)
             await Repository.individual_update(lot_table, manualCountOfCheckedOut,ColumnName,projectRequestArray[0].LotId);
             // end

             let lot_item_count = lot_identified[0].ItemCount;
             let lot_count_of_checked_out = lot_identified[0].CountOfCheckedOutItems+1;

             if (lot_item_count === lot_count_of_checked_out){
               let deplete = {
                 Depleted: 4
               };
               let table_name = "lots";
               // updating depleted status
               let depletionUpdate = await ModelMaster.update_deplete(table_name, deplete, ColumnName, projectRequestArray[0].LotId);
               if (depletionUpdate.changedRows > 0){
                 console.log("depletionUpdate")

                 // update checked_out column by ensuring values do not fall below zero
                 // only subtract item count from CheckedOut when its value is above zero
                   if (updated_checked_value.CheckedOut > 0) {
                   var newStockAfterDepletionHasMany = {
                     CheckedOut: updated_checked_value.CheckedOut - lot_count_of_checked_out
                   };

                   // update products.CheckedOut after all items are finished,
                   //ensuring in_stock or checked_out do not fall below zero
                   let product_checked_out_stock_after_depletionHasMany =
                     await ProductController.update_checked_out_stock_after_depletion(updated_checked_value.CheckedOut, newStockAfterDepletionHasMany, projectRequestArray[0].ProductId);
                   responseObject = product_checked_out_stock_after_depletionHasMany;
                 } else {
                   responseObject = {
                     success: false,
                     message: "products.CheckedOut < 0.",
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
             } else {
               console.log("not equal");
               console.log(lot_item_count +" "+ lot_count_of_checked_out)
             }
           }

         }

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
    let second_column = "UserId"
    let responseObject = {};
    // try see if code already exists
    let projectRequestArray = await CatalogueItemsController.selectSpecificWithTwoParameters(userValidationColumn,recordObject.Code, second_column, recordObject.UserId);

    // fetch in_stock value as is in the database
    let oldStock = await CatalogueItemsController.getOldStockRecords(recordObject.ProductId);

    // if code does not exist, insert record
    if(projectRequestArray.length === 0) {
      let insertResponse = await Repository.insert(tableName,recordObject);
      if (insertResponse.success === true){

        // get new stock records after adding a new item to stock
        let stock = await CatalogueItemsController.get_stock_records(recordObject.ProductId);

        // up date InStock column in products
        if (stock[0].NumberOfRecords > 0){
          let product_id = recordObject.ProductId;
          var newStock = {
            InStock: stock[0].NumberOfRecords,
          };
          let new_stock = await ProductController.individualUpdate(oldStock[0].NumberOfRecords, newStock, product_id);

          if (new_stock.success === true){
            responseObject = insertResponse;
            // set item count
            // where count === 1, item count = number of catalogue items
            let ColumnName = "LotId";
            let item_count_ = await Repository.item_count(ColumnName, recordObject.LotId);
            let jsonObj = {
              ItemCount: item_count_[0].NumberOfRecords
            }
            let table_name = "lots";

           await ModelMaster.individual_update(table_name, jsonObj, ColumnName, recordObject.LotId);
            // end setting item count
          }


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
      // code already exists, increase counter and update in_stock

      // get existing counter of catalogue item: recordObject.Counter and increase with each scan
      let jsonObject = {
        Counter: projectRequestArray[0].Counter + 1
      };
      console.log( jsonObject);

      let ColumnName = "CatalogueItemId";
      let catalogue_item_id = projectRequestArray[0].CatalogueItemId;
      // update has many
      let has_many_items={
        HasManyItems: 1
      }
      let hasMany = await Repository.individual_update(tableName,has_many_items,ColumnName,catalogue_item_id);
      // end



      // update counter on catalogue item
       let counter_update = await Repository.individual_update(tableName, jsonObject, ColumnName, catalogue_item_id);
       // after counter increases, add new value to InStock
      if (counter_update.success === true){
        // get in_stock value for specific productId
        let in_stock_value = await ProductController.selectSpecific(projectRequestArray[0].ProductId);
        let in_stock = in_stock_value[0].InStock;
        // end
        let add_count_to_stock = {
          InStock: (oldStock[0].NumberOfRecords + jsonObject.Counter) - 1
        };
        console.log( "first: "+ in_stock + " "+ "final: "+add_count_to_stock.InStock);
       await ProductController.individualUpdate(in_stock, add_count_to_stock, projectRequestArray[0].ProductId);

       // set lot_item_count for codes with numerous items
        let column_name = "LotId";
        let item_count_ = await Repository.item_count(column_name, recordObject.LotId);
        let jsonObj = {
          ItemCount: (item_count_[0].NumberOfRecords + jsonObject.Counter)-1
        }
        let table_name = "lots";
        await ModelMaster.individual_update(table_name, jsonObj, column_name, recordObject.LotId);
        // end set item count

      } // end adding count to in_stock
      responseObject = {
        success: false,
        message: "code already exists. Item Number:"+ jsonObject.Counter+" inserted",
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
