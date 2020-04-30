import config from '../config'
import {
    authHeader
} from '../helpers'
import {
    responseService
} from './response'
//const qs = require('qs');
export const user = {
    login,
    loginHost,
    regiter,
    updateInfo
}

function login(body) {
    let header = {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
    }
    return responseService.fetchRetry(`${config.apiUrl}login`, {
        method: 'POST',
        headers: header,
        mode: 'cors', 
        body: JSON.stringify(body),
    }, 4)
}

function loginHost(body) {
    let header = {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
    }
    return responseService.fetchRetry(`${config.apiUrl}loginhost`, {
        method: 'POST',
        headers: header,
        body: JSON.stringify(body),
    }, 1)
}

function regiter(body) {
    let header = {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
    }
    return responseService.fetchRetry(`${config.apiUrl}regiter`, {
        method: 'POST',
        headers: header,
        body: JSON.stringify(body),
    }, 1)
}

function updateInfo(body,userId) {
    return responseService.fetchRetry(`${config.apiUrl}user/${userId}`, {
        method: 'PUT',
        headers: authHeader(),
        body: JSON.stringify(body),
    }, 1)
}