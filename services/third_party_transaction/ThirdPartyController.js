
const ApiConnector = require('../api_connector/ApiConnector');
const RolesController = require('../../controllers/user_management/RolesController.js');



module.exports = class ThirdPartyController{


  static async fetchAllRoles() {
      const apiRoute = "/get_all_roles_third_party";
      const returnedPromise = await ApiConnector.apiGetAll(apiRoute);
//{ results:
//    [ RowDataPacket { RoleId: 1, RoleDescription: 'user', RoleCode: 1 } ] }
    var	jsonObject_ = {
      RoleDescription:returnedPromise.data[0].RoleDescription,
      RoleCode:returnedPromise.data[0].RoleCode
    };
      let store = await RolesController.insert(jsonObject_);
    console.log(returnedPromise);
  }

}




