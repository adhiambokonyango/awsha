const axios = require('axios');
const { stripIndent } = require('common-tags');
const { escape } = require('querystring');

exports.handler = function(context, event, callback) {
  const twiml = new Twilio.twiml.MessagingResponse();
  const query = escape(event.Body);
  const npmSearchApiUrl = `https://registry.npmjs.com/-/v1/search?text=${query}&fields=name,author,description,rating&sort=rating:desc`;

  const menuMessage = 'Hi, am a bot and my name is Govi. Pleased to welcome you to Kenya Covid-19 support team. Type any of the topic numbers below for any query \n\n 1) Measures for Covid-19 \n\n 2) Symptoms \n\n 3) Testing \n\n 4) Treatment \n\n 5)Myths \n\n 6) Prevention \n\n 7) Travel \n\n 8) Scams \n\n 9) Coping with stress during Covid-19 \n\n 10) Helping children cope with stress during covid-19'



  if(query !== '1' && query !== '2' && query !== '3' && query !== '4' && query !== '5' && query !== '6' && query !== '7' && query !== '8' && query !== '9' && query !== '10') {
    twiml.message(menuMessage);
    callback(null, twiml);

  } else if(query === '1') {

    const apiRoute = '/get_all_measure_description';
    const databaseField = 'MeasureDescription';
    apiQuery(apiRoute,databaseField);

  }  else if(query === '2') {
    const apiRoute = '/get_all_symptom_descriptions';
    const databaseField = 'SymptomDescription';
    apiQuery(apiRoute,databaseField);
  } else if(query === '3') {
    const apiRoute = '/get_all_testing_description';
    const databaseField = 'TestingDescription';
    apiQuery(apiRoute,databaseField);
  } else if(query === '4') {
    const apiRoute = '/get_all_treatment_description';
    const databaseField = 'TreatmentDescription';
    apiQuery(apiRoute,databaseField);
  } else if(query === '5') {
    const apiRoute = '/get_all_myths_description';
    const databaseField = 'MythsDescription';
    apiQuery(apiRoute,databaseField);
  } else if(query === '6') {
    const apiRoute = '/get_all_prevention_descriptions';
    const databaseField = 'PreventionDescription';
    apiQuery(apiRoute,databaseField);
  } else if(query === '7') {
    const apiRoute = '/get_all_travel_description';
    const databaseField = 'TravelDescription';
    apiQuery(apiRoute,databaseField);
  } else if(query === '8') {
    const apiRoute = '/get_all_scam_description';
    const databaseField = 'ScamDescription';
    apiQuery(apiRoute,databaseField);
  } else if(query === '9') {
    const apiRoute = '/get_all_stress_coping_description';
    const databaseField = 'StressCopingDescription';
    apiQuery(apiRoute,databaseField);
  } else if(query === '10') {
    const apiRoute = '/get_all_children_tips_description';
    const databaseField = 'ChildrenTipsDescription';
    apiQuery(apiRoute,databaseField);
  }



  function apiQuery(ip,databaseField){

    axios.post('http://bot.covid.kopa.xyz'+ip)
      .then(response => {
        var responseString = '';
        for(var i = 0;i<response.data.results.length;i++) {
          responseString = responseString + '('+(i+1)+')' + response.data.results[i][databaseField] + '\n\n';
        }

        twiml.message(responseString);
        callback(null, twiml);
      })
      .catch(response => {
        twiml.message(response);
        callback(null, twiml);
      });
  }

};
