import config from '../config'
import {
    authHost
} from '../helpers'
import {
    responseService
} from './response'
//const qs = require('qs');
export const repas = {
    listRepas,
    deleteRepas
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
function deleteRepas(repasId) {
    return responseService.fetchRetry(`${config.apiUrl}repas/${repasId}`, {
        method: 'DELETE',
        headers: authHost(),
        mode: 'cors'
    }, 4)
}