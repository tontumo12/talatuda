import config from '../config'
import {
    responseService
} from './response'
const qs = require('qs');
export const repas = {
    listRepas,
    deleteRepas,
    listRepasType,
    choiseRepas
}

function listRepas() {
    let header = {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
    }
    return responseService.fetchRetry(`${config.apiUrl}repas`, {
        method: 'GET',
        headers: header,
        mode: 'cors',
    }, 4)
}
function listRepasType(type,max,min) {
    let payload = {
        type: type,
        min: min,
        max: max
    }
    let header = {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
    }
    let _qs = qs.stringify(payload);
    return responseService.fetchRetry(`${config.apiUrl}repas?${_qs}`, {
        method: 'GET',
        headers: header,
        mode: 'cors',
    }, 4)
}
function deleteRepas(repasId) {
    let header = {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
    }
    return responseService.fetchRetry(`${config.apiUrl}repas/${repasId}`, {
        method: 'DELETE',
        headers: header,
        mode: 'cors'
    }, 4)
}
function choiseRepas(repasId) {
    let header = {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
    }
    return responseService.fetchRetry(`${config.apiUrl}repas/${repasId}`, {
        method: 'PUT',
        headers: header,
        mode: 'cors'
    }, 4)
}