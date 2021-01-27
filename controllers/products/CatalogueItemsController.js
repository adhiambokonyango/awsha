const Repository=require('../Repository');
const tableName="catalogue_items";


module.exports = class CatalogueItemsController{

  static async insert(recordObject){
    let response = await Repository.insert(tableName,recordObject);
    return response;
  }

  static async insert_unique_code(recordObject){
    let userValidationColumn = "Code";
    let responseObject = {};
    let projectRequestArray = await CatalogueItemsController.get_specific_records(userValidationColumn,recordObject.Code);
    if(projectRequestArray.length === 0) {
      let insertResponse = await Repository.insert(tableName,recordObject);
      responseObject = {
        registrationSuccess: true,
        registrationErrorMessage: "code registration successful" ,
        codeDetails: insertResponse,
      }
    } else {
      responseObject = {registrationSuccess: false, registrationErrorMessage: "code already exists"}
    }
    return responseObject;
  }

  static async selectAll(){
    let response = await Repository.selectAll(tableName);
    return response;
  }

  static async get_checked_out_stock_records(){
    let response = await Repository.get_checked_out_stock_records();
    return response;
  }

  static async get_in_stock_records(){
    let response = await Repository.get_in_stock_records();
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
}
