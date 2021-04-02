const axios =require( "axios");

const querystring =require( "querystring");
//const EndPoint =require( "../../config/EndPoint");
//const { header } = require("request");
const ip = "http://127.0.0.1:8080";

const token = '123'

module.exports = class ApiConnector{

  static apiPost(payload, apiRoute) {
    return new Promise(function(resolve, reject) {
      axios
        .post(
          ip + apiRoute,
          querystring.stringify({
            ...payload
          })
        )
        .then(response => {
          resolve(response);
        })
        .catch(response => {
          reject(response);
        });
    });
  }

  static apiGetAll(apiRoute) {
    return new Promise(function(resolve, reject) {
      axios
        .post(ip + apiRoute,
          {
            headers: {
              'Authorization': `token ${token}`
            }
          })
        .then(response => {
          resolve(response);
        })
        .catch(response => {
          reject(response);
        });
    });
  }

}


