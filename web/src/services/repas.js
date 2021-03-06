import config from '../config'
import {
    responseService
} from './response'
const qs = require('qs');
export const repas = {
    listRepas,
    deleteRepas,
    listRepasType,
    choiseRepas,
    pointRepas,
    getPointRepa
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
        type: type
    }
    if(max > 50){
        payload['min'] = min
        payload['max'] = max
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
function pointRepas(repasId,point) {
    let header = {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
    }
    let payload = {
        point: point
    }
    return responseService.fetchRetry(`${config.apiUrl}repas/${repasId}`, {
        method: 'POST',
        headers: header,
        body: JSON.stringify(payload),
        mode: 'cors'
    }, 4)
}
function getPointRepa(repasId) {
    let header = {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
    }
    return responseService.fetchRetry(`${config.apiUrl}repas/${repasId}/point`, {
        method: 'GET',
        headers: header,
        mode: 'cors'
    }, 4)
}
