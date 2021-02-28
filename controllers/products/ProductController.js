const Repository=require('../Repository');
const tableName="products";
const ModelMaster=require('../../models/ModelMaster');


module.exports = class ProductController{

  static async insert(recordObject){
    let response = await Repository.insert(tableName,recordObject);
    return response;
  }


  static async selectAll(){
    let response = await Repository.selectAll(tableName);
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


  static async individualUpdate(columnValue,recordObject, product_id){
    let columnName = "InStock";
    let response = await ModelMaster.stocks_update(tableName,recordObject,columnName,columnValue, product_id);
    return response;
  }

  static async update_checked_out_stock(columnValue,recordObject, product_id){
    let columnName = "CheckedOut";
    let response = await ModelMaster.update_checked_out_stock(tableName,recordObject,columnName,columnValue, product_id);
    return response;
  }

  static async update_checked_out_stock_after_depletion(columnValue,recordObject, product_id){
    let columnName = "CheckedOut";
    let response = await ModelMaster.update_checked_out_stock_after_depletion(tableName,recordObject,columnName,columnValue, product_id);
    return response;
  }

}
