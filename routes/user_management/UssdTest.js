// const request = require('request');
//
// request(
//   {
//     url: "http://jsonplaceholder.typicode.com/posts",
//     json: true
//   },
//   (err, response, body) =>{
//     console.log(JSON.stringify(body, undefined, 4));
//     console.log(err)
//   });
//






// // ussd attempt
// router.get('/session/:sessionId/start',
//   function(req, res) {
//     const url = "http://localhost:5000/session/:sessionId/start"
//     var options = {
//       body: {
//         text: req.params.text,
//         shortCode: req.params.shortCode,
//         networkName: req.params.networkName,
//         MSISDN: req.params.MSISDN,
//         countryName: req.params.countryName,
//
//       }
//     }
//     const promise = axios.get(url, options);
//     res.json(
//       promise.data
//     )
//     promise.then(
//       function(result){
//         console.log(result);
//       }
//     )
//   })
// // router.post('/session/{sessionId}/start');
// // router.put("session/{sessionId}/response");
// router.post('/ussd_test', urlencodedParser, function (request, response){
//   const url = "http://jsonplaceholder.typicode.com/posts";
//   const options = {
//     body: {
//
//     },
//     response:{},
//     err:{}
//   };
//   const AXIOS_RESPONSE = axios.get(url, options);
//   response.json({
//     // count: AXIOS_RESPONSE.data.length,
//     repos: AXIOS_RESPONSE.data,
//   });
//   AXIOS_RESPONSE.then(
//     function(result){
//       console.log(result);
//     }
//   )
// })
