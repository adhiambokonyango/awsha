import axios from "axios";
import querystring from "querystring";
import { transactionsIp } from "../../config/EndPoint";

export function transactionsServicePost(payload, apiRoute) {
    return new Promise(function(resolve, reject) {
        axios
            .post(
                transactionsIp + apiRoute,
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

export function transactionsServiceGetAll(apiRoute) {
    return new Promise(function(resolve, reject) {
        axios
            .post(transactionsIp + apiRoute)
            .then(response => {
                resolve(response);
            })
            .catch(response => {
                reject(response);
            });
    });
}

export const promiselessTransactionsServiceGetAll = apiRoute => axios.post(transactionsIp + apiRoute);

export const promiselessTransactionsServicePost = (payload, apiRoute) =>
    axios.post(
        transactionsIp + apiRoute,
        querystring.stringify({
            ...payload
        })
    );
