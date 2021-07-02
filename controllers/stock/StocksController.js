const Repository=require('../Repository');


module.exports = class StocksController{
  static fetch_stocks(user_id){
    return new Promise(async function(resolve, reject) {
      let fetch = Repository.innerJoinStockAndProducts(user_id);
      fetch.then(function(result){
        resolve(result);
      }, function(err){
        console.log(err);
        reject(err);
      })

    })}
}